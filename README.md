tz-lookup
=========
This is a little Javascript library that allows you to look up the time zone of
a location given its latitude and longitude. It works in both the browser and
in Node.JS, and is very fast and lightweight (~71KB) given what it does.

The execution part of the library is also ported to Swift. JS is used to generate swift file with the timezone data included. PRs adding more lanugages are encouraged. 

**This library is a fork of an old [DarkSky library](https://github.com/darkskyapp/tz-lookup-oss). It has been updated to reflect new timezone changes and is up to date as of 17 December 2023**

Usage
-----

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

The database was last updated on 26 March 2023 as of this writing.

One can check for new releases at [github/timezone-boundary-builder](https://github.com/evansiroky/timezone-boundary-builder/releases/)

If there is a new one, edit `rebuild.sh` to use it. If you do so, you need to run `rebuild.sh`


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
