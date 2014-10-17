# urequire-rc-teacup-js

## Introduction

[uRequire](http://urequire.org) [ResourceConverter](http://urequire.org/resourceconverters.coffee) that converts `*.teacup` (that were previously converted to `.js` with [`teacup-js`](http://npmjs.org/package/urequire-rc-teacup-js)) to `.html`.

Essentially it loads the `.js` module (cleanly each time with `Module::requireClean`) and invokes the exported template function, passing the right args.

## Usage

```
    $ npm install urequire-rc-teacup-js2html --save
```

To simply convert all `*.teacup` to `.html` :

```javascript
 resources: [ ..., 'teacup-js', 'teacup-js2html'...]
```

## Options

```javascript
    resources: [
      ['teacup-js2html', {
        deleteJs: true                  // deletes the .js module after .html conversion
        args: ['1stArg', '2ndArg', ...] // arguments to pass to template function for all templates
      }]
    ]
```

To pass different args to different module/templates, use this args options syntax:

```javascript
    resources: [
      ['teacup-js2html', {

        args: {
             'some/minimatch/string/**/*': ['1stArg', '2ndArg', ...]

             whateverLabel:
                isFileIn: ['**/some/minimatch/string/*', /.SomeRegExp/, '!', (f)-> f is 'not/this/file']
                args: ['1stArg', '2ndArg', ...]
        }
      }]
    ]
```

For the full `isFileIn` syntax, see [`is_file_in`](http://github.com/anodynos/is_file_in).

Note: your previously converted `.js` with [`teacup-js`](http://npmjs.org/package/urequire-rc-teacup-js)) must be build with either 'nodejs' or 'UMD' templates, because it is `require`-d by uRequire on the nodejs environment. Specifically the `combined` and `AMD` templates are not supported. You templates can still be used as converted to AMD on web though.

# License

The MIT License

Copyright (c) 2014 Agelos Pikoulas (agelos.pikoulas@gmail.com)

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
