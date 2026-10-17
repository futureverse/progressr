# TODO

Features and design ideas to be considered for future releases.

## Formalize the total-progress-budget-of-one contract

Each task is implicitly understood to have a total `amount` of `1` to
“spend” across all of its calls to
[`progressor()`](https://progressr.futureverse.org/reference/progressor.md),
e.g.

\
`p``(``amount ``=`` ``0``)`\
`p``(``amount ``=`` ``0.5``)`\
`p``(``amount ``=`` ``1``)``  ``# default`

This has been the de facto design contract since the beginning, but it
is not formally documented or validated anywhere. Consider:

- Documenting this contract explicitly in
  [`?progressor`](https://progressr.futureverse.org/reference/progressor.md)
  and the vignettes.
- Optionally warning (opt-in?) if the cumulative `amount` reported by a
  progressor exceeds its allotted total, to help users catch bugs.

## Allow a task to expand or shrink its number of steps

A task may not know its total number of steps up front, e.g. it
discovers partway through that it needs to split into, say, five
subtasks. There is currently no way to relay this back to the overall
`steps` count used by
[`progressor()`](https://progressr.futureverse.org/reference/progressor.md).

Idea: support something like

\
`p``(``amount ``=`` ``0``, expand ``=`` ``+``5``)``   ``# grow the total by 5 steps`\
`...`\
`p``(``amount ``=`` ``0``, expand ``=`` ``-``3``)``   ``# later, shrink back down by 3 steps`

Open questions:

- How does `expand` interact with
  [`handlers()`](https://progressr.futureverse.org/reference/handlers.md)
  that have already rendered a progress bar with a fixed total (e.g.
  [`utils::txtProgressBar()`](https://rdrr.io/r/utils/txtProgressBar.html)),
  where the max value cannot easily be changed mid-flight?
- Should `expand` be relative (`+5`/`-3`) as sketched above, or should
  there also be an absolute form (e.g. `steps = 10`)?
- How should this be communicated through `makeProgressionHandler()` to
  existing handlers, i.e. does this require a new progression condition
  field (e.g. `amount`’s sibling `expand`), and how should handlers that
  are unaware of `expand` degrade gracefully?

## Relay which task a sequence of progression updates belongs to

A single task often sends several progression updates over its lifetime,
e.g. “I’ve started”, “I’m still running, +0.1 done”, …, “I’m done,
here’s the remaining delta”:

\
`p``(``amount ``=`` ``0``)``                 ``# task has started`\
`p``(``amount ``=`` ``0.1``)``                ``# a few more steps done, still running`\
`...`\
`p``(``amount ``=`` ``remaining_delta``)``    ``# final update, closes out to amount = 1`

Internally, each `progression` condition already carries a
`progressor_uuid` (and `owner_session_uuid`) identifying which
[`progressor()`](https://progressr.futureverse.org/reference/progressor.md)
it came from, and a `type` field that distinguishes `"initiate"`,
`"update"`, and `"finish"` (see `R/progression.R` and `R/progressor.R`).
So the plumbing to tell updates apart by task already exists at the
condition level. What appears to be missing:

- A documented, user-facing way to get at this - e.g. can a handler or a
  downstream consumer easily tell “these three progression conditions
  all came from the same task” without reaching into
  internal/`@keywords internal` fields like `progressor_uuid`?
- A human-readable task label/name (as opposed to an opaque UUID) that a
  caller could optionally set once (e.g. via
  `progressor(..., label = "download")`) and have carried on every
  subsequent `p()` call from that task, for handlers that want to render
  per-task status (started / running / done).
- A convenience for the common “close out whatever is left” pattern,
  e.g. `p(amount = NA)` or similar meaning “add whatever `amount` is
  needed to bring this task’s cumulative total up to `1`”, instead of
  requiring the caller to track and compute `remaining_delta` by hand.

## Document how to gather and re-relay incoming progression conditions

There is currently no end-user or developer documentation on how to
write a handler (or similar) that *gathers* incoming `progression`
conditions and decides, on its own terms, how and when to relay them
onward. A concrete use case: a handler sitting between many downstream
progress updates (e.g. from nested futures) and the thing ultimately
presenting progress, which only wants to relay, say, 1 out of every 100
collected updates upstream - either to reduce intrusiveness/ overhead,
or because the upstream consumer can’t keep up.

Gathering is particularly useful for *nested* task structures. For
example, 50 outer iterations each running 75 inner iterations produce
3,750 individual progress updates in total. Relaying every single one of
those upstream (e.g. to a terminal progress bar, or across a
future/cluster boundary) is both wasteful and more granular than any
human-facing renderer needs; what matters upstream is typically a much
coarser signal, e.g. one update per outer iteration, or one every 100
inner updates regardless of which outer iteration they belong to.

Prior art already in the package that is relevant here, but not tied
together into guidance:

- [`progressor()`](https://progressr.futureverse.org/reference/progressor.md)
  already has `offset`/`scale`/`transform` arguments (see
  `R/progressor.R`) for mapping an inner progressor’s step numbering
  into an outer progressor’s step space - this addresses nested *step
  accounting*, but not nested *event volume*. Even with steps correctly
  flattened/transformed, a 50x75 nested loop still signals 3,750
  separate `progression` conditions; `offset`/`scale`/ `transform` don’t
  reduce that count, they just make the numbers line up.
- [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md)
  already supports a time-based throttle via its
  `interval`/`times`/`intrusiveness` arguments (see
  `R/make_progression_handler.R`), which controls how often a handler
  *renders*, i.e. “no more often than every N seconds.” This is
  different from a *count-based* “every Nth update” throttle, which does
  not appear to exist.
- [`with_progress()`](https://progressr.futureverse.org/reference/with_progress.md)
  already talks about capturing and relaying conditions (`delay_stdout`,
  `delay_conditions`; see `R/with_progress.R`), which is close in spirit
  to “gather now, relay later” but is about stdout/other conditions
  around the progress session, not about re-batching the progression
  updates themselves.

Open questions / things to document or add:

- Is there already a supported way to write a custom `handler` function
  (the `handler` argument to
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md))
  that accumulates state across calls (e.g. a counter in a closure) and
  only forwards/renders every Nth update? If so, this should be written
  up as a worked example in a (new?) developer-facing vignette.
- If no such mechanism exists, consider adding a built-in, reusable
  helper (e.g. a count-based analogue to `interval`, such as
  `every = 100`) to
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md)
  so handler authors don’t have to reimplement counting/batching logic
  themselves.
- Clarify how “relaying upstream” is meant to work across session/
  process boundaries (e.g. nested
  [`with_progress()`](https://progressr.futureverse.org/reference/with_progress.md)
  calls, or progress from futures/workers bubbling up to the top-level
  session) versus just within a single handler instance.

## Support structured, machine-readable progression messages

Related to the gather-and-relay idea above: a task’s progress `message`
does not have to be a human-readable string. A framework could instead
have tasks and subtasks send progression updates whose `message` encodes
a small structured payload (e.g. a JSON object describing which subtask,
what state, etc.). A gathering handler could then collect and parse
these structured messages and summarize the result either by:

- feeding the summary straight into its own renderer, or
- signaling brand new, regular `progression` conditions (with plain,
  human-readable `message`s) that ordinary `progressr` handlers can
  consume as-is, i.e. using the gathering handler as a
  “translator”/aggregator layer in front of standard handlers.

Note that `message` is already documented as accepting “a character
vector or a function” (see
[`?progression`](https://progressr.futureverse.org/reference/progression.md)),
and nothing in
[`progression()`](https://progressr.futureverse.org/reference/progression.md)
itself coerces `message` to character at creation time - only
`conditionMessage.progression()` does `as.character(message)` when
rendering it (see `R/progression.R`). So, in principle, a structured
object could already be stashed in `message` (e.g. as a closure
returning a JSON string, or even as a list, as long as the handler
consuming it knows to look past the default
[`conditionMessage()`](https://rdrr.io/r/base/conditions.html)
coercion). This is, however, undocumented and unsupported as a design
pattern. Consider:

- Documenting (and testing) that `message` may carry structured,
  non-human-readable data for cases where the consuming handler knows
  how to interpret it, as opposed to always being, or coercing cleanly
  to, a display string.
- Deciding whether structured payloads belong in `message` at all,
  versus being passed via the `...` (additional named elements) of
  [`progression()`](https://progressr.futureverse.org/reference/progression.md)/[`progressor()`](https://progressr.futureverse.org/reference/progressor.md),
  which may be the more natural place for machine-readable,
  handler-specific metadata.
- Providing a worked example (vignette and/or `@examples`) showing a
  custom handler that parses such structured updates from several
  (sub)tasks and re-signals a condensed, human-readable `progression`
  condition for consumption by standard handlers like
  [`handler_txtprogressbar()`](https://progressr.futureverse.org/reference/handler_txtprogressbar.md)
  or
  [`handler_cli()`](https://progressr.futureverse.org/reference/handler_cli.md).

Caveat: a generic, open-ended “metadata” field is risky because
`progression` conditions are not only consumed in-process - they may be
serialized and relayed over channels `progressr` does not control
(e.g. across **future** workers/clusters, or any other
condition-forwarding mechanism). An arbitrarily large structured payload
attached to every update could then blow up serialization size/time and
network overhead for every single progress update, not just the ones
that need it. `progression` objects already track this indirectly -
`print.progression()` reports both the in-memory and *serialized* size
of a condition (via `serialization_size()`; see `R/progression.R`) - so
size-awareness is already a concern in the package, just not yet
enforced or documented as a constraint for any future “carry structured
metadata” feature. Any such feature should therefore:

- Keep structured metadata strictly opt-in and caller-sized (i.e. the
  caller must decide to add it and keep it small), not a default or
  implicit part of every `p()` call.
- Consider documenting/warning about (or even capping) payload size for
  any new metadata field, precisely because the sender cannot know in
  advance which handlers/channels a condition will be relayed through.
- Favor designs where heavy payloads are summarized/reduced as early as
  possible (e.g. close to where they are generated, such as within a
  gathering handler on the same worker) rather than relayed upstream in
  full and only reduced once they reach a top-level handler.

## Convey per-task success/failure/error/interrupted, not just completion

A progression update currently has no standard way to say *how* a task
finished - only that it did. At the
per-[`progressor()`](https://progressr.futureverse.org/reference/progressor.md)
level, the `"finish"` type (see `R/progressor.R`) is signaled via
[`on.exit()`](https://rdrr.io/r/base/on.exit.html) regardless of whether
the enclosing call returned normally or exited via an error/interrupt -
there is no `type = "error"` or `type = "interrupted"` counterpart at
that level, so a handler cannot currently distinguish “this task’s
progressor finished because the task succeeded” from “… because the task
errored/was interrupted”.

Prior art that is close, but scoped differently:

- [`with_progress()`](https://progressr.futureverse.org/reference/with_progress.md)
  already detects an error or interrupt condition raised by its *entire*
  wrapped expression and signals a
  `control_progression("interrupt", message = ...)` to handlers (see
  `handle_interrupt_or_error()` in `R/with_progress.R`, and
  `global_progression_handler.R`), and
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md)
  already has a dedicated `interrupt` reporter slot that several
  handlers implement
  (e.g. [`handler_beepr()`](https://progressr.futureverse.org/reference/handler_beepr.md),
  [`handler_cli()`](https://progressr.futureverse.org/reference/handler_cli.md),
  [`handler_txtprogressbar()`](https://progressr.futureverse.org/reference/handler_txtprogressbar.md)).
  This is a whole-*session* level signal, though: it fires once, for the
  top-level `with_progress(expr)` call as a whole, not per task/subtask
  within it. For example, in a `future_lapply()` over 1,000 tasks where
  a handful of the tasks error out but the overall call still returns
  (e.g. errors are caught/collected per-element), today there is no
  progression signal distinguishing those failed tasks from the
  successful ones.

Open questions:

- Should this be a new `type` value (e.g. `"error"`) alongside the
  existing `"initiate"`/`"update"`/`"finish"`/`"shutdown"`/
  `"interrupt"`, or should `"finish"` gain a status field (e.g.
  `status = c("success", "error", "interrupted")`) carried alongside it?
- How would a caller signal this in practice? e.g. would
  [`progressor()`](https://progressr.futureverse.org/reference/progressor.md)’s
  own [`on.exit()`](https://rdrr.io/r/base/on.exit.html)-based
  auto-finish need to detect whether it’s running during error unwinding
  (akin to `base::on.exit(..., after = ...)` or inspecting
  [`sys.on.exit()`](https://rdrr.io/r/base/sys.parent.html)/condition
  handling at exit time), or would this need to be explicit,
  e.g. `p(type = "error")`/`p(amount = 0, status = "error")` called by
  the user’s own
  [`tryCatch()`](https://rdrr.io/r/base/conditions.html)/[`try()`](https://rdrr.io/r/base/try.html)
  around the task body?
- How should existing handlers that don’t know about a new
  error/interrupted status degrade gracefully (e.g. just treat it as a
  normal `"finish"`), consistent with how unknown `type`s/reporter slots
  are already ignored elsewhere in
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md)?

Related: a task may also finish early by its own choice rather than by
error or interruption, e.g. an inner loop declared with `steps = 75`
decides after 43 steps that it’s done (converged, found what it was
looking for, etc.) and deliberately stops - this is neither an error nor
an interruption, it is a *successful* but early finish. This interacts
with [the budget-of-one
contract](#formalize-the-total-progress-budget-of-one-contract) and with
[`steps`/`expand`](#allow-a-task-to-expand-or-shrink-its-number-of-steps):

- If `amount`/`step` are derived from the declared `steps = 75`, then
  stopping at step 43 leaves the task’s cumulative `amount` short of
  `1` - e.g. a `txtprogressbar`-style handler may be left showing “57%
  done” forever for that task’s slice of the bar, unless the early
  `"finish"` is itself treated as “jump straight to `amount = 1`”
  (similar to the “close out the remaining delta” idea in the
  task-identity section above).
- Should an early, successful finish be distinguishable (e.g. for
  logging/summaries) from a finish that ran all declared steps? Or is it
  enough that, from the progress bar’s point of view, any `"finish"`
  simply means “fill this task’s slice to 100% and move on,” regardless
  of how many of the declared steps were actually used?

## Signal “this task/step was skipped” (important for ETA estimation)

Separately from success/failure/early-finish above, it should be
possible to signal that a task or step was *skipped* entirely, i.e. no
real work was done for it (e.g. it was already cached, excluded by a
filter, or a no-op). This matters specifically for ETA estimation:

`progressr` itself does not compute ETA - that is delegated to
downstream renderers (e.g. **cli**’s
[`cli::pb_eta`](https://cli.r-lib.org/reference/progress-variables.html),
used by
[`handler_cli()`](https://progressr.futureverse.org/reference/handler_cli.md),
or **progress**’s `:eta`, used by
[`handler_progress()`](https://progressr.futureverse.org/reference/handler_progress.md);
see `R/handler_cli.R` and `R/handler_progress.R`), which estimate time
remaining from elapsed time versus steps/amount completed so far -
implicitly assuming roughly uniform work per step. A run of skipped
steps completing “instantly” looks, to that kind of estimator, like the
task sped up a lot, which skews the rate used to project ETA for the
remaining, non-skipped work. The same problem applies to any custom
gathering handler (see the gathering section above) that tries to
compute its own throughput/ETA from collected updates.

Open questions:

- Should this be a new `type` (e.g. `"skip"`), parallel to the
  `"error"`/`"interrupted"`/early-`"finish"` cases discussed above, so
  it’s really one broader “how did this update/task conclude” vocabulary
  rather than several one-off special cases?
- A skipped task/step presumably still counts toward overall completion
  (the `amount`/`steps` total), it just shouldn’t count toward the
  *rate* used for ETA. Handlers and gathering layers need a way to tell
  these apart - does that mean the `skip` signal needs to be visible all
  the way down to whatever does the ETA math (e.g. passed through to
  **cli**/**progress**), or is it enough for a gathering handler to
  filter skipped updates out before computing its own rate/ETA and
  relaying a plain `"update"` upstream?
- How should existing handlers that don’t recognize `"skip"` degrade
  (presumably: treat it just like a normal `"update"`/`"finish"`, same
  as the graceful-degradation question raised above)?

## Signal step state (started, running, finished, skipped, errored) in `p()` and render with distinct symbols and colors

The core API currently lacks a first-class way to signal the execution
*state* of an individual step or task on each `p()` call. Today, `p()`
accepts `message`, `amount`, `class`, and `...` (see `R/progressor.R`),
and while condition objects carry an internal `type` field
(`"initiate"`, `"update"`, `"finish"`, etc.; see `R/progression.R`),
that field serves the condition-handling lifecycle rather than
communicating the domain state of a unit of work.

If `p()` allows callers to explicitly declare state:

\
`p``(``state ``=`` ``"started"``)``    ``# or "running": work on this step/task has begun`\
`...`\
`p``(``state ``=`` ``"finished"``)``   ``# completed successfully (default when amount > 0)`\
`# or terminal alternatives:`\
`p``(``state ``=`` ``"skipped"``)``    ``# step bypassed (cached, filtered, no-op)`\
`p``(``state ``=`` ``"errored"``)``    ``# step failed with an error`\
`p``(``state ``=`` ``"interrupted"``)``# step was aborted`

then progression handlers could use that rich information to render
non-binary progress in the terminal and other interfaces.

### Rendering multi-state progress bars

Progress bars traditionally treat steps as strictly binary: completed vs
remaining (e.g. `[========------------] 40%`). With explicit step
states, renderers can display multi-state bars that distinguish
in-flight work from finished, skipped, or failed work using different
characters, symbols, or ANSI colors:

- **In-flight / running steps**: Represented using active symbols (e.g.
  `>`, `~`, spinning glyphs `|/-\`) or accent colors (e.g. cyan, amber,
  blue).
- **Retrying / restarted steps**: Represented using retry glyphs (e.g.
  `↻`, `>²`, or blinking/amber indicators) to highlight repeated work.
- **Finished steps**: Represented using standard completion symbols
  (e.g. `=`, `#`, `✔`) or green.
- **Skipped steps**: Represented using dimmed or distinct symbols (e.g.
  `-`, `s`) or grey.
- **Errored / interrupted steps**: Represented using alert symbols (e.g.
  `!`, `✖`) or red.

Possible rendering layouts include:

- *Stacked / segmented bar*: e.g. `[====>>>↻!!s-----] 40%` (4 finished,
  3 in-flight, 1 retrying, 2 errored, 1 skipped, 5 pending).
- *Per-step glyph / array view*: e.g. `[✔✔✔▶▶↻!s··]` for discrete step
  lists or worker status grids.
- *ANSI color-segmented bar*: A continuous bar where completed,
  in-flight, retrying, errored, and skipped fractions are rendered with
  distinct background or foreground colors.

### Lifecycle state machine: retries and restarts

In real-world distributed, network-bound, or fault-tolerant workflows,
tasks may need to restart or retry. Examples include automatic retries
upon transient HTTP or database errors, re-dispatching a future after a
cluster node failure, spot-instance preemption, or a watchdog restarting
a stalled worker.

This implies that step states do not merely follow a one-way progression
from `pending` to a terminal state (`finished`/`skipped`/`errored`), but
form a state machine supporting restarts and retries:

```
               +------------------+
               |     pending      |
               +------------------+
                        |
                        v
        +-------->   started   <---------+
        |               |                |
        | (restart)     v                | (retry)
        +---------   running             |
                     /  |  \             |
                    /   |   \            |
                   v    |    v           |
             finished   |   errored -----+
                        v
                   interrupted
```

Key state transitions to support:

- `running -> started`: A task that was already in-flight resets or
  restarts from scratch (e.g. parameter divergence, watchdog reset).
- `errored -> started`: A failed task is retried after catching an error
  (e.g. exponential backoff on network timeout).
- `interrupted -> started`: A task that was cancelled or preempted is
  resumed or retried.

### Visualizing concurrency and worker utilization

This is particularly impactful for parallel workflows (e.g. **future**
with multiple background workers or cluster nodes):

- Without a `"started"` signal, a progress bar only updates when tasks
  *complete*. While heavy computations run, the bar sits completely
  static, providing no visual indication of whether workers are active
  or stalled.
- With `p(state = "started")` (or `"running"`), multiple concurrent
  tasks signal their start before finishing. Handlers can immediately
  show the number of actively computing workers (e.g. showing 8 `>`
  slots in flight across an 8-core cluster), giving users real-time
  feedback on worker concurrency and resource utilization.

### Interactions with existing proposals

This proposal connects and unifies several related items in this file:

- [Convey per-task success/failure/error/interrupted, not just
  completion](#convey-per-task-successfailureerrorinterrupted-not-just-completion):
  Moves error and interrupt signaling from whole-session exception
  handling into the per-step `state` vocabulary.
- [Signal “this task/step was
  skipped”](#signal-this-taskstep-was-skipped-important-for-eta-estimation):
  Treats `"skipped"` as one of the standard step states alongside
  `"finished"` and `"errored"`.
- [Relay which task a sequence of progression updates belongs
  to](#relay-which-task-a-sequence-of-progression-updates-belongs-to):
  Provides the task correlation needed so handlers know which
  `"started"` step matches a subsequent `"finished"` or `"errored"`
  update.

### Open questions

- **API ergonomics & defaults**:
  - Should `state` be a formal argument to
    [`progressor()`](https://progressr.futureverse.org/reference/progressor.md)’s
    returned function,
    e.g. `p(amount = 1, state = c("finished", "started", "running", "skipped", "errored", "interrupted"))`?
  - What should the default be when `state` is not specified? Calling
    `p()` with `amount > 0` should default to `state = "finished"` for
    backward compatibility. Does `p(state = "started")` implicitly
    default to `amount = 0` (marking a step in-flight without advancing
    the completed count)?
- **Retries, restarts & counter integrity**:
  - If a task transitions `errored -> started` or `running -> started`,
    how do handlers adjust counts without double-counting in-flight
    steps? A naive counter
    (`in_flight = started - finished - errored - skipped`) would
    increment `in_flight` a second time unless the handler either
    maintains a per-task state table (keyed by `progressor_uuid` or slot
    index) or the update explicitly signals a restart/retry
    (e.g. `p(state = "restarted")` or
    `p(state = "started", retry = TRUE)`).
  - **Budget-of-one reset/refund**: If a task spent partial `amount`
    (e.g. `p(amount = 0.4)`) before failing or restarting, does
    transitioning back to `started` implicitly reset or refund that
    task’s spent amount back to `0`? If a progress bar has already
    advanced to reflect that 0.4, does it visibly step backward upon
    restart, or does the handler hold progress until the retried task
    surpasses its previous point?
  - **Impact on ETA estimation**: Time spent on failed or restarted
    attempts produces no net progress. Should an ETA engine include that
    time in its overall throughput calculations (reflecting the
    real-world cost of retries), or should retried elapsed time be
    isolated to avoid skewing rate estimates for healthy tasks?
- **Slot tracking in handlers**:
  - How should handlers track active in-flight steps? For aggregate
    segmented bars, a simple counter of
    `in_flight = started - finished - errored - skipped` may suffice.
    For per-step glyph arrays, handlers need a way to correlate start
    and stop events to a specific slot (e.g. via `step` index or task
    identity / UUID).
  - How should handlers handle out-of-order events or orphaned starts
    (e.g. if a worker crashes before signaling finish)?
- **Handler support & graceful degradation**:
  - Existing handlers that only inspect `progression$amount` (e.g.
    [`utils::txtProgressBar()`](https://rdrr.io/r/utils/txtProgressBar.html))
    will naturally ignore `state` and continue advancing only on
    completed `amount`, so `p(state = "started")` remains a safe no-op
    for unaware handlers.
  - Which handlers should natively implement multi-state rendering?
    [`handler_cli()`](https://progressr.futureverse.org/reference/handler_cli.md)
    and
    [`handler_txtprogressbar()`](https://progressr.futureverse.org/reference/handler_txtprogressbar.md)
    could support configurable characters and ANSI colors for each
    state, and a specialized concurrency handler could display active
    worker slots.

## A built-in ETA engine in `progressr` itself

As noted above, `progressr` currently does not compute ETA at all - it
just forwards `amount`/`step`/`time` on each `progression` condition,
and each handler’s underlying renderer (**cli**’s
[`cli::pb_eta`](https://cli.r-lib.org/reference/progress-variables.html),
**progress**’s `:eta`, etc.) does its own, independent rate-based ETA
estimation from that. This means ETA quality and behavior differs per
handler, every handler effectively re-implements the same
amount-vs-elapsed-time math, and there’s no single place that could
account for `progressr`-specific signals like `"skip"` updates (see
above), nested tasks, or multiple concurrent progressors contributing to
one overall ETA.

Idea: provide an ETA engine inside `progressr` that listens to *all*
incoming progression updates (plausibly implemented as, or alongside, a
“gathering” handler/layer - see the gathering section above) and itself
produces ETA estimates, which it could then either expose for handler
authors to use directly, or relay as new fields/conditions that any
handler can pick up without having to implement its own rate estimation.

Open questions:

- Where would this live - as a new built-in “reporter” field/API passed
  to handlers via
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md),
  as a standalone helper handlers can opt into, or as part of
  [`with_progress()`](https://progressr.futureverse.org/reference/with_progress.md)/the
  global progression handler itself?
- What estimator should it use - a simple linear
  elapsed-time-per-completed-amount rate (like most existing renderers),
  a moving/exponentially-weighted average that adapts to changing rates,
  or something configurable? How would it combine estimates across
  multiple concurrent progressors (e.g. several parallel workers each
  with their own rate)?
- How would it use `"skip"` updates (excluded from the rate calculation
  but still counted toward completion), early/partial finishes (see
  above), and `expand`/`steps` changes (see above) so the ETA doesn’t
  become wildly wrong when the denominator itself is moving?
- Should this replace, or simply complement/feed into, the ETA already
  computed by downstream renderers like **cli** and **progress**? Fully
  replacing them would mean reimplementing functionality those packages
  already provide; just complementing them mainly helps handlers that
  don’t have their own ETA logic
  (e.g. [`handler_txtprogressbar()`](https://progressr.futureverse.org/reference/handler_txtprogressbar.md)).
- Should the computed ETA be exposed to handler authors as part of the
  existing `state`/`config` passed into reporter functions in
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md),
  so handlers that want to display it don’t need to compute it
  themselves?

## Audit laziness/consistency of how `progressr.enable` is ingested

(Prompted by documenting, in
[`?progressr.options`](https://progressr.futureverse.org/reference/progressr.options.md)
and
[`?handlers`](https://progressr.futureverse.org/reference/handlers.md),
that
[`handlers()`](https://progressr.futureverse.org/reference/handlers.md)
only treats `progressr.enable` as read every time progress is reported -
i.e. lazily - when handlers are specified by name or as unevaluated
handler functions, e.g. `handlers("txtprogressbar")`. If a handler is
instead passed already-called, e.g.
`handlers(handler_txtprogressbar())`, the option is resolved once, at
that call, and effectively locked in for that handler object’s
lifetime.)

`progressr.enable` is not read in just one place; at least:

- [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md)
  (`R/make_progression_handler.R:98`) reads it as a default for its own
  `enable` argument, falling back to
  [`interactive()`](https://rdrr.io/r/base/interactive.html) if unset.
- [`progressor()`](https://progressr.futureverse.org/reference/progressor.md)
  (`R/progressor.R:66`) independently reads it as a default for its own
  `enable` argument, falling back to `TRUE` (*not*
  [`interactive()`](https://rdrr.io/r/base/interactive.html)) if unset -
  and, like the already-called-handler case above, this value is
  resolved once, at
  [`progressor()`](https://progressr.futureverse.org/reference/progressor.md)
  creation time, and baked into that progressor’s closure for its whole
  lifetime (see `void_progressor` in `R/progressor.R`, also referenced
  in the “[Make `p()` a no-op when nothing is
  listening](#make-p-a-no-op-when-nothing-is-listening)” section below).
- [`handler_filesize()`](https://progressr.futureverse.org/reference/handler_filesize.md),
  [`handler_slowdown()`](https://progressr.futureverse.org/reference/handler_slowdown.md),
  and
  [`handler_shiny()`](https://progressr.futureverse.org/reference/handler_shiny.md)
  (`R/handler_filesize.R:30`, `R/handler_slowdown.R:26`,
  `R/handler_shiny.R:32`) each have their *own*
  `enable = getOption("progressr.enable", TRUE)` default, rather than
  deferring to
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md)’s
  default - also falling back to `TRUE`, not
  [`interactive()`](https://rdrr.io/r/base/interactive.html).

So there are (at least) two axes of inconsistency:

- *When* the option is resolved - lazily, on every progress event
  (string/name handlers, via `as_progression_handler()`), versus once
  and locked in (already-called handler objects; every
  [`progressor()`](https://progressr.futureverse.org/reference/progressor.md)
  call).
- *What* the fallback default is when the option is altogether unset -
  [`interactive()`](https://rdrr.io/r/base/interactive.html) in
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md),
  but a hardcoded `TRUE` in
  [`progressor()`](https://progressr.futureverse.org/reference/progressor.md)
  and the three handler constructors above. (In practice,
  `update_package_options()` in `R/options.R` already sets
  `progressr.enable` to
  [`interactive()`](https://rdrr.io/r/base/interactive.html) at package
  load time - see
  `update_package_option("enable", ..., default = interactive())` around
  `R/options.R:280` - so this divergence is currently masked for
  ordinary use; it would only surface if something explicitly unset the
  option again, e.g. `options(progressr.enable = NULL)`.)

Open questions:

- Should there be a single, canonical ingestion point for
  `progressr.enable` (e.g. only
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md)
  reads the option;
  [`progressor()`](https://progressr.futureverse.org/reference/progressor.md)
  and the three handler constructors above defer to it/a shared helper
  instead of each hardcoding their own `getOption(...)` default), so the
  two inconsistencies above collapse into one documented, single-sourced
  behavior?
- Should ingestion always be lazy (resolved at the moment progress is
  actually about to be rendered/signaled), or is “baked in at
  construction time” actually the intended, documented contract for
  [`progressor()`](https://progressr.futureverse.org/reference/progressor.md)
  and already-called handler objects? Right now this reads as an
  accident of implementation (whether the default argument happens to be
  forced before or after the user next changes the option) rather than a
  deliberate design choice.
- This directly matters for parallel/future workers: if ingestion
  becomes (or is clarified to already be) lazy end-to-end, then a worker
  process must never itself flip `progressr.enable` globally
  (e.g. `options(progressr.enable = FALSE)`) as a local
  optimization/side effect, since - on a *persistent* worker reused
  across multiple `future()` calls (e.g. `multisession`/cluster
  backends) - that would silently disable progress reporting for every
  *subsequent*, unrelated task dispatched to that same worker, not just
  the one that flipped it. This is a sharper version of the propagation
  gap already discussed in “[Make `p()` a no-op when nothing is
  listening](#make-p-a-no-op-when-nothing-is-listening)” below: that
  section is about *master → worker* propagation of `progressr.enable`;
  this is about the reverse direction - a worker’s own code must not be
  allowed to mutate that option persistently and leak the change across
  tasks/sessions it doesn’t own.

## Make `p()` a no-op when nothing is listening

Investigate whether the function returned by
[`progressor()`](https://progressr.futureverse.org/reference/progressor.md)
(what users call as `p()`) can cheaply become a true no-op whenever
there is no progress handler actually listening - not just when the user
explicitly disabled progress via `enable = FALSE`.

There is already a related mechanism to build on: when `enable = FALSE`
(controlled by the `progressr.enable` option),
[`progressor()`](https://progressr.futureverse.org/reference/progressor.md)
immediately returns a prebuilt `void_progressor <- function(...) NULL`
instead of constructing a real progressor (see `R/progressor.R`). But
`enable` defaults to `TRUE` and is a static choice made once, at
[`progressor()`](https://progressr.futureverse.org/reference/progressor.md)
creation time - it says nothing about whether the call actually happens
inside an active
[`with_progress()`](https://progressr.futureverse.org/reference/with_progress.md)
session (or under a manually registered handler via
[`register_global_progression_handler()`](https://progressr.futureverse.org/reference/register_global_progression_handler.md)).
In the common case of a package that unconditionally sprinkles `p()`
calls through a tight loop, but whose caller never wrapped the call in
[`with_progress()`](https://progressr.futureverse.org/reference/with_progress.md),
every single `p()` call today still: increments `progression_index`,
builds a full `progression` condition object
([`structure()`](https://rdrr.io/r/base/structure.html) with ~15 fields,
including a `session_uuid()` lookup and timestamp formatting; see
[`progression()`](https://progressr.futureverse.org/reference/progression.md)
in `R/progression.R`), and runs it through
`withRestarts(signalCondition(cond), ...)` - all for a condition that,
with nothing listening, is immediately discarded. That construction
cost, not the (cheap)
[`signalCondition()`](https://rdrr.io/r/base/conditions.html) itself, is
the overhead worth eliminating for tight loops.

There is also already a notion of a dynamic “is a handler currently
active” state elsewhere in the package - see the `active` flag inside
[`global_progression_handler()`](https://progressr.futureverse.org/reference/global_progression_handler.md)
in `R/global_progression_handler.R`, which
[`with_progress()`](https://progressr.futureverse.org/reference/with_progress.md)
toggles off/on around its own global handler registration. Something
similar, but exposed cheaply enough to check on every `p()` call, is
what this idea needs.

Open questions:

- R has no built-in, cheap way to ask “is there a calling handler
  installed for condition class `progression`?” without actually
  signaling a condition. Any detection would have to be via
  `progressr`’s own bookkeeping (e.g. a package-level flag flipped by
  [`with_progress()`](https://progressr.futureverse.org/reference/with_progress.md)/[`register_global_progression_handler()`](https://progressr.futureverse.org/reference/register_global_progression_handler.md)
  on enter/exit), not a general R introspection mechanism - so this can
  only ever detect “no *progressr-managed* session is active,” not
  “literally nobody is listening” (a user could always install their own
  `withCallingHandlers(expr, progression = ...)` directly, outside
  [`with_progress()`](https://progressr.futureverse.org/reference/with_progress.md),
  which `progressr` could not see).
- False negatives (treating a call as a no-op when something *was*
  actually listening) would silently drop real progress updates, so any
  such flag must fail safe (default to “assume someone might be
  listening”) whenever its state is ambiguous, e.g. across process/
  worker boundaries where futures run detached from the main session’s
  [`with_progress()`](https://progressr.futureverse.org/reference/with_progress.md)
  state.
- Would switching between “real” and “no-op” behavior need to happen
  per-`p()`-call (cheap flag check every time) or could a progressor
  that starts with nobody listening simply stay a no-op for its whole
  lifetime (and vice versa), trading a bit of responsiveness (a
  progressor created just before
  [`with_progress()`](https://progressr.futureverse.org/reference/with_progress.md)
  starts wouldn’t “wake up”) for simplicity?
- How much does this actually save in practice? Worth profiling
  [`progression()`](https://progressr.futureverse.org/reference/progression.md)’s
  construction cost (object allocation, `session_uuid()`, timestamp
  formatting) in a tight loop before investing in the detection
  machinery, to confirm the payoff is worth the added complexity and the
  risk of silently-dropped updates above.

A concrete mechanism for the “how to detect it” question above: have the
calling environment
(i.e. [`with_progress()`](https://progressr.futureverse.org/reference/with_progress.md),
which already knows whether it actually installed any handlers) query
and record “is a listener active,” and broadcast that as a plain R
option, which any nested
[`progressor()`](https://progressr.futureverse.org/reference/progressor.md)
call - including one created inside a future dispatched to a worker -
can just read via [`getOption()`](https://rdrr.io/r/base/options.html).
This is *already* largely in place for the plain, single-process case:
[`?with_progress`](https://progressr.futureverse.org/reference/with_progress.md)
documents that enabling/disabling is controlled by the
`progressr.enable` option (or the `R_PROGRESSR_ENABLE` environment
variable), and
[`with_progress()`](https://progressr.futureverse.org/reference/with_progress.md)
concretely sets `options(progressr.enable = enable)` for the duration of
its call (see `R/with_progress.R`, around where
`options[["progressr.enable"]] <- enable` is assigned and then applied
via `options(options)`). Every
[`progressor()`](https://progressr.futureverse.org/reference/progressor.md)
call already defaults its own `enable` argument to
`getOption("progressr.enable", TRUE)` (see `R/progressor.R`), so a
function called from inside an active
[`with_progress()`](https://progressr.futureverse.org/reference/with_progress.md)
block already inherits “yes, enabled” (or “no, disabled”) through this
option without any extra plumbing - as long as it runs in the *same R
process*.

Where this idea adds something new is the future/worker boundary:
[`options()`](https://rdrr.io/r/base/options.html) set in the main
session are not automatically copied into a separate **future** worker
process (e.g. `multisession`/cluster backends start with their own,
independent option defaults), so a
[`progressor()`](https://progressr.futureverse.org/reference/progressor.md)
created *inside* a future body currently falls back to
`getOption("progressr.enable", TRUE)` as evaluated *in the worker*, not
as it was in the master session that actually knows whether anyone is
listening. (Note: a progressor created in the master and merely *used*
inside a future already sidesteps this, since its `enable` value is
baked into the closure at creation time and travels with it as part of
the future’s exported globals - this gap is specifically about
progressors created fresh inside worker code.)

Open questions specific to this mechanism:

- Would propagating `progressr.enable` (and perhaps other
  progress-relevant options) to workers need to piggyback on
  **future**’s own globals-export mechanism (e.g. via
  [`future::plan()`](https://future.futureverse.org/reference/plan.html)
  options, or `future.globals`), or would `progressr` need its own hook
  into **future** (e.g. something run at the start of every future
  expression) to copy the option across?
- Is a single boolean option enough, or does “is a listener active” need
  to be richer - e.g. which handlers, with what `interval`/ `times`
  settings - so a worker-side progressor can make the same no-op
  decision a master-side one would?
- This would need to stay consistent with the “fail safe” principle
  above: if propagation itself fails or is skipped (e.g. an unsupported
  future backend), the worker-side default must remain “assume enabled,”
  not silently go quiet.

This whole idea is already on record, in more detail than the above, as
two still-open upstream issues:

- [futureverse/progressr#2](https://github.com/futureverse/progressr/issues/2)
  (“PERFORMANCE: Avoid progress updates if no one is listening”) and
  [futureverse/progressr#155](https://github.com/futureverse/progressr/issues/155)
  (“Detect registered progress handler”) discuss a “confirm”/handshake
  design: a publisher signals a `progression` carrying a `confirm`
  callback, and a listening handler calls it back (then
  `invokeRestart("muffleProgression")`), so the publisher learns someone
  is there without a separate side channel. \#2 explicitly raises the
  future/worker case: *“the relaying of conditions by the future
  framework: when future collects `conditions = 'progression'` … the
  publisher needs a way to know that it will not receive a confirmation
  in this case. For the latter, maybe this can be done via a global R
  option which is set for some of the future backends … but not
  others?”* - i.e. the exact option-based mechanism sketched above.
  \#155 separately proposes a simpler boolean check
  (`has_progressr_handlers()` / `progression_handler_exists()`), and
  notes a real caution from the maintainer’s own prior answer: a package
  should not change its *own* internal behavior (e.g. a task-splitting
  strategy) based on whether progress is enabled, since the user may
  have turned on a global handler for reasons unrelated to that package.
- The future/worker half of this is also blocked on a longstanding,
  still-open gap in **future** itself, not something `progressr` can
  solve unilaterally:
  [futureverse/future#134](https://github.com/futureverse/future/issues/134)
  (“R options: [`options()`](https://rdrr.io/r/base/options.html) are
  not passed down to futures - should they?”, open since 2018)
  establishes that R’s global
  [`options()`](https://rdrr.io/r/base/options.html) are not
  automatically copied into future workers at all (only a few
  `future.globals.*` options got special-cased in future 1.9.0); the
  documented workaround is always to manually snapshot options into a
  global and restore them inside the future body. A concrete, still-open
  proposal to fix this generally is
  [futureverse/future#480](https://github.com/futureverse/future/issues/480),
  which would add a `future(..., options = c("foo", BAR = 42L))` (and
  `envvars =`) argument for explicit, per-call option passing. Henrik’s
  own stated design reasoning there favors this explicit, opt-in
  approach over silently/automatically forwarding everything, since not
  all future backends can set options on their workers - the same
  fail-safe/opt-in principle noted above. Any
  `progressr.enable`-to-worker propagation should probably build on
  `future#480`’s mechanism if/when it lands, rather than `progressr`
  inventing its own separate propagation channel.

A more targeted alternative to both of the above: a `future_meta`
convention on the **future** side (tracked in
`~/futureverse/future/TODO.md`) where a function can declare, via an
attribute on the function itself, extra options that should be forwarded
to the worker whenever that function is referenced by a future
expression. This is specifically aimed at the gap identified above - a
*fresh*
[`progressor()`](https://progressr.futureverse.org/reference/progressor.md)
call made inside worker-executed code (e.g. code injected by
`progressify()`), which today resolves `enable` from
`getOption("progressr.enable", TRUE)` as evaluated *in the worker*, with
no knowledge of what the master session had set.

The metadata has to sit on the exported generator function
[`progressr::progressor`](https://progressr.futureverse.org/reference/progressor.md)
itself, not on the closure it returns - a returned progressor’s
no-op-ness is already permanently decided by the time it exists, so
annotating it is too late to change anything. The generator’s attribute
doesn’t need to be shipped anywhere either: it’s part of the installed
`progressr` package, so it’s already present, identically, on any worker
that attaches the package. All `future` needs to do is: when its
existing globals/packages analysis of a future expression notices that
`progressor` is referenced (which it already must do today, to know the
worker needs the `progressr` package attached), also check for this
metadata, snapshot `getOption("progressr.enable")` from the *master*,
and arrange for it to be set on the worker (e.g. an auto-generated
`options(progressr.enable = <value>)` prologue) before the expression
runs. Then a fresh
[`progressor()`](https://progressr.futureverse.org/reference/progressor.md)
call on the worker resolves `enable` to the master’s actual value and
correctly becomes `void_progressor` there too, with zero per-call-site
annotation from the end user or from `progressr` callers. This idea is
entirely blocked on `future` adopting the `future_meta` mechanism at
all - it does not exist yet.

Update (2026-10-12): the attribute-on-a-function architecture this needs
already has a close relative on the futureverse roadmap - the
`resources` mechanism
(<https://www.futureverse.org/roadmap/resources.html>,
<https://www.jottr.org/2026/08/11/roadmap-resources-memory/>), which
sets `attr(fcn, "resources")` via `resources(fcn) <- function(...) ...`
and is consulted automatically by `futurize()`. So far it’s scoped to
compute resources (memory, walltime, GPU), not packages/globals/
options, but extending it to cover this case is probably preferable to
`future` inventing a separate `future_meta` attribute from scratch. See
`~/futureverse/future/TODO.md` and
[future-ideas#1117](https://github.com/HenrikBengtsson/future-ideas/issues/1117)
for the fuller writeup, including how `progressr` itself would declare
`options = "progressr.enable"` package-wide (not per-function): attach
`resources` to `progressr`’s own `.onLoad()` as the default convention
(no new API or file format needed), with a `Config/future/options`
DESCRIPTION field or a load-free sidecar file as later, opt-in
optimizations only for packages that want to avoid the namespace-load
cost of inspecting `.onLoad()`.

Caveat (worked out in more detail in `~/futureverse/future/TODO.md`):
per-function detection like the above has a real blind spot for *nested*
futures whose existence/body is only constructed dynamically at runtime
(as opposed to being lexically nested in the outer future’s literal
source) - there is nothing for any ancestor’s static analysis to find in
advance in that case, so the forwarded value never reaches the level
where it’s actually needed. The more robust version of this idea moves
the trigger from “is `progressor` referenced in this specific
expression” to “is the `progressr` package currently loaded in my
session” (checked via
[`loadedNamespaces()`](https://rdrr.io/r/base/ns-load.html), not
[`search()`](https://rdrr.io/r/base/search.html), since
`progressify()`-generated code would plausibly call
[`progressr::progressor()`](https://progressr.futureverse.org/reference/progressor.md)
without ever attaching the package) - a session-level fact that’s far
more likely to already hold at every nesting level than a per-expression
textual reference. This still needs `future` to implement that check
independently of its existing `packagesOf(globals)`-based
package-forwarding pipeline, since that pipeline is itself gated by the
same static per-expression detection and wouldn’t otherwise provide the
improvement for free.
