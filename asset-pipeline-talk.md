Asset Pipeline

* Overview
    - The first feature of the pipeline is to concatenate assets, which can reduce the number of requests that a browser makes to render a web page. Web browsers are limited in the number of requests that they can make in parallel, so fewer requests can mean faster loading for your application
    - Preprocessing .... very unclear on exactly what this means.
    - Touch on CDNs?
* Concatenation
    - The sprockets-rails gem takes all js and css files and concatenates them in to one "master" file (one for each type, so you end up with just one .css and one .js file.)
    - This "master" file is then fingerprinted by rails. When the file is altered, that fingerprint is changed, and that change will cause the client (web browser) to request an updated version. That way, you only pull down a new one if there's some reason to (aka, something is now different).
        + Rails does this via the filename by appending a hash to it. So your css file, for example, would end up looking something like this: global-908e25f4bf641868d8683022a5b62f54.css.
* Manifest files
    - These contain "directives" that are used by sprockets to know what files need to be concatenated.
    - For JS, these directives are preceded with //= so they will appear to be comments.
    - There seem to be two basic types of directives: one that includes a specific file by name ("require jquery_ujs"), and one that looks recursively for every file with that extension in a given directory ("require_tree .").
* Minification
    - For css, basically just removes whitespace. For JS, it's more complicated -- there are different options you can use, but to varying degrees, they might:
        + Change variable names to be shorter
        + Join consecutive var declarations (to comma separated form)
        + Shortening if/else statements (by using ternary, for example)
        + Removing comments, curly braces and space where possible