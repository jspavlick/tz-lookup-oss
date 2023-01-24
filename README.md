tz-lookup
=========
This is a little Javascript library that allows you to look up the time zone of
a location given its latitude and longitude. It works in both the browser and
in Node.JS, and is very fast and lightweight (~71KB) given what it does.

The execution part of the library is also ported to Swift. JS is used to generate swift file with the timezone data included. PRs adding more lanugages are encouraged. 

**This library is a fork of an old [DarkSky library](https://github.com/darkskyapp/tz-lookup-oss).**

Usage
-----

### JS 

~~To install:~~

~~```npm install tz-lookup```~~

OUTDATED: NPM points to original dark sky library. Use `tz.js` file directly or create a new package pointing to this repo. 


Node.JS usage:

```javascript
var tzlookup = require("tz-lookup");
console.log(tzlookup(42.7235, -73.6931)); // prints "America/New_York"
```

Browser usage:

```html
<script src="tz.js"></script>
<script>
alert(tzlookup(42.7235, -73.6931)); // alerts "America/New_York"
</script>
```

**Please take note of the following:**

*   The exported function call will throw an error if the latitude or longitude
    provided are NaN or out of bounds. Otherwise, it will never throw an error
    and will always return an IANA timezone database string. (Barring bugs.)

*   The timezones returned by this module are approximate: since the timezone
    database is so large, lossy compression is necessary for a small footprint
    and fast lookups. Expect errors near timezone borders far away from
    populated areas. However, for most use-cases, this module's accuracy should
    be adequate.
    
    If you find a real-world case where this module's accuracy is inadequate,
    please open an issue (or, better yet, submit a pull request with a failing
    test) and I'll see what I can do to increase the accuracy for you.

### Swift

Copy generated `tz.swift` file to your project. Than simply call the function: 

```swift
print(TimezoneLookup.tzLookup(lat: 42.7235, lon: -73.6931)) // prints "America/New_York"
```

### Adding additional languages 

PRs with more lanugages are encouraged. To add a new language, port `tz_template.js` file and add the generating call at the end of `rebuild.sh`. 


Sources
-------
Timezone data is sourced from Evan Siroky's [timezone-boundary-builder][tbb].
The database was last updated on 2 Dec 2022.

Regenerating
------------

To regenerate the library's database yourself, you will need to install GDAL:

```
$ brew install gdal # on Mac OS X
$ sudo apt install gdal-bin # on Ubuntu
```

Then, simply execute `rebuild.sh`. Expect it to take 10-30 minutes, depending
on your network connection and CPU.

[tbb]: https://github.com/evansiroky/timezone-boundary-builder/

License
-------
To the extent possible by law, The Dark Sky Company, LLC has [waived all
copyright and related or neighboring rights][cc0] to this library.

[cc0]: http://creativecommons.org/publicdomain/zero/1.0/
