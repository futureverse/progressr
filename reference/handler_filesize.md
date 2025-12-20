# Progression Handler: Progress Reported as the Size of a File on the File System

Progression Handler: Progress Reported as the Size of a File on the File
System

## Usage

``` r
handler_filesize(
  file = "default.progress",
  intrusiveness = getOption("progressr.intrusiveness.file", 5),
  target = "file",
  enable = getOption("progressr.enable", TRUE),
  ...
)
```

## Arguments

- file:

  (character) A filename.

- intrusiveness:

  (numeric) A non-negative scalar on how intrusive (disruptive) the
  reporter to the user.

- target:

  (character vector) Specifies where progression updates are rendered.

- enable:

  (logical) If FALSE, then progress is not reported.

- ...:

  Additional arguments passed to
  [`make_progression_handler()`](https://progressr.futureverse.org/reference/make_progression_handler.md).

## Details

This progression handler reports progress by updating the size of a file
on the file system. This provides a convenient way for an R script
running in batch mode to report on the progress such that the user can
peek at the file size (by default in 0-100 bytes) to assess the amount
of the progress made, e.g. `ls -l -- *.progress`. If the `*.progress`
file is accessible via for instance SSH, SFTP, FTPS, HTTPS, etc., then
progress can be assessed from a remote location.

## Examples

``` r
if (FALSE) { # \dontrun{
handlers(handler_filesize(file = "myscript.progress"))
with_progress(y <- slow_sum(1:100))
print(y)
} # }
```
