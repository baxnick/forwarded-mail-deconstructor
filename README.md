# Forwarded Mail Deconstructor

Takes a fowarded chain of emails and breaks it up into more usable elements - messages, from addresses, to addresses, etc.. If you're not working with the plaintext, make sure to use the Mail gem to obtain the decoded `text_part`.

## Current Status

Very rough around the edges prototype stage. Currently
 * Parses metadata to extract email participants etc
 * Detects quoted sections and strips them out
 * Demarcates where a sig begins so it can be removed
 * Dumps an unwieldy tangle of arrays and hashes in your lap to deal with
 * Not packaged as a gem yet, run with `rake && ruby -Ilib`

## Example Usage
    eml_text = %Q{ ... }
    m = Mail.new(eml_text)

    refined_body = m.text_part.body.decoded.gsub(/\r\n?/, "\n")
    sections = refined_body.split(/^\-{5,}.*/)

    ast = sections.map{ |s| Parse::Parser.parse(s)}
    export = ast.map { |s| s.export unless s.nil? }

## How it Works

Barely. Next question.

## How does it attempt to work?

The first steps required currently aren't included directly, it:
 1. Preprocesses the text to normalise the line endings
 2. Uses String::split to break it up into chunks
 3. Builds an abstract syntax tree using Treetop
 4. Calls export() on the root node, the default action is to propagate the call, useful syntax nodes will export some text, a hash, or an object

