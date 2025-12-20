# Progression Handler: Progress Reported via the Pushbullet Messaging Service

A progression handler for
[`RPushbullet::pbPost()`](https://rdrr.io/pkg/RPushbullet/man/pbPost.html)
of the RPushbullet package.

## Usage

``` r
handler_rpushbullet(
  intrusiveness = getOption("progressr.intrusiveness.rpushbullet", 5),
  target = "gui",
  ...,
  title = "Progress update from R",
  recipients = NULL,
  email = NULL,
  channel = NULL,
  apikey = NULL,
  devices = NULL
)
```

## Arguments

- intrusiveness:

  (numeric) A non-negative scalar on how intrusive (disruptive) the
  reporter to the user.

- target:

  (character vector) Specifies where progression updates are rendered.

- title:

  The title of the note being posted.

- recipients:

  A character or numeric vector indicating the devices this post should
  go to. If missing, the default device is looked up from an optional
  setting, and if none has been set the push is sent to all devices.

- email:

  An alternative way to specify a recipient is to specify an email
  address. If both `recipients` and `email` are present, `recipients` is
  used.

- channel:

  A channel tag used to specify the name of the channel as the
  recipient. If either `recipients` or `email` are present, they will
  take precedence over `channel`.

- apikey:

  The API key used to access the service. It can be supplied as an
  argument here, via the global option `rpushbullet.key`, or via the
  file `~/.rpushbullet.json` which is read at package initialization
  (and, if found, also sets the global option).

- devices:

  The device to which this post is pushed. It can be supplied as an
  argument here, or via the file `~/.rpushbullet.json` which is read at
  package initialization.

- ...:

  Additional arguments passed to
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md).

## Requirements

This progression handler requires the RPushbullet package, a Pushbullet
account, and configuration according to the instructions of the
RPushbullet package. It also requires internet access from the computer
where this progress handler is registered.

## Examples

``` r
pkg <- "RPushbullet"
if (requireNamespace(pkg, quietly = TRUE)) {

  handlers("rpushbullet")
  with_progress({ y <- slow_sum(1:10) })
  print(y)
  
}
#> Error : lexical error: invalid char in json text.
#>                                        ~/.rpushbullet.json
#>                      (right here) ------^
#> 
#> Warning: The 'rpushbullet' progress handler will not work, because RPushbullet is not properly configured. See help("pbSetup", package = "RPushbullet") for instructions. RPushbullet::pbValidateConf() reported:
#>     No configuration specified.  Assuming user meant: ~/.rpushbullet.json
#>     ~/.rpushbullet.json is not a valid JSON string or a file containing such.
#> M: Added value 1
#> M: Added value 2
#> M: Added value 3
#> M: Added value 4
#> M: Added value 5
#> M: Added value 6
#> M: Added value 7
#> M: Added value 8
#> M: Added value 9
#> M: Added value 10
#> [1] 55
```
