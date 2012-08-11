FMAS3Datetime
=============

FileMaker to ActionScript Date Time parser





There is a date-time parser useful when you are dealing with dates to and from FileMaker (FMDate, FMTime, FMTimeStamp) and ActionScript (allways Date). If you like static classes, that may be better for the case, then declare it as public static class DateTimeParser, then simply import the package and call methods as static functions. Instead use as is, instantiating the class and calling the instance methods.
 
Remember that you should send/receive STRINGS to/from FileMaker WPE, not ActionScript Date objects, then you should convert the FileMaker date-like formated strings to ActionScript Date objects. In ActionScript Date, Time and Timestamp are describet using the same class object, the Date() class object, so all Date, Time and Timestamp FileMaker strings should be converted to AS3 Date objects, and to corresponding strings before sent back to FM.
 
 
Keeping this on ming there are the utility function signatures: 
 
FMdate2date ( value : String ) : Date 
Date2FMdate ( date : Date ) : String 
FMtime2date ( value : String ) : Date 
Date2FMtime ( date : Date ) : String 
FMtimestamp2date ( value : String ) 
Date2FMtimestamp ( date:Date ) : String 
 
 
from FileMaker...

```AS3
var d:Date = DateTimePasrser.FMtimestamp2date ( "12/31/2000 12:00:00" )
```

back to FileMaker...

```AS3
var s:String = DateTimePasrser.Date2FMtimestamp ( d );
```


