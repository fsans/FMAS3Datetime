package es.ntwk.tools
/**
 * DateTimeParser class
 *
 * @langversion ActionScript 3
 * @playerversion Flash 9.0.0
 *
 * @author Francesc Sans
 * @since 20.03.2009
 */

{

		public class DateTimeParser
		{

			/*
			* FM Date to AS Date
			* FM DATE string format: 'MM/dd/yyyy'
			* AS DATE object constructor: 'Date(YYYY,MM,dd,hh,mm,ss,ms)'
			*/
			public static function FMdate2date(value:String):Date
			{
				if (value == '' || value == null)
					return null;
				var da:Array=value.split('/');
				var thedate:Date=new Date(da[2], da[0] - 1, da[1], 0, 0);
				return thedate;
			}

			/*
			* AS Date to FM Date
			* FM DATE string format: 'MM/dd/yyyy'
			* AS DATE object constructor: 'Date(YYYY,MM,dd,hh,mm,ss,ms)'
			*/
			public static function Date2FMdate(date:Date):String
			{
				if (date == null)
					return null;
				var str:String;
				str+=date.getMonth().toString() + '/';
				str+=date.getDate().toString() + '/';
				str+=date.getFullYear().toString();
				return str
			}

			/*
			* FM Time to AS Date (no AS time !)
			* FM DATE string format: 'HH:mm:ss'
			* AS DATE object constructor: 'Date(YYYY,MM,dd,hh,mm,ss,ms)'
			*/
			public static function FMtime2date(value:String):Date
			{
				if (value == '' || value == null)
					return null;
				var da:Array=value.split('/');
				var thedate:Date=new Date(0, 0, 0, da[0], da[1], da[2]);
				return thedate;
			}

			/*
			* AS Date to FM Time  (no AS time !)
			* FM TIME string format: 'HH:mm:ss'
			* AS DATE object constructor: 'Date(YYYY,MM,dd,hh,mm,ss,ms)'
			*/
			public static function Date2FMtime(date:Date):String
			{
				if (date == null)
					return null;
				var str:String;
				var hour12:Number=date.getHours() % 12;
				if (hour12 == 0)
					hour12=12;
				str+=hour12 + ':';
				str+=date.getMinutes().toString() + ':';
				str+=date.getSeconds().toString();
				str+=date.getHours() < 12 ? 'AM' : 'PM';
				return str;
			}

			/*
			* FM TimeStamp to AS Date
			* FM TimeStamp string format: 'MM/dd/yyyy HH:mm:ss AM-PM'
			* AS DATE object constructor: 'Date(YYYY,MM,dd,hh,mm,ss,ms)'
			*/
			public static function FMtimestamp2date(value:String):Date
			{
				if (value == '' || value == null)
					return null;
				var d:Array=value.split(' '); // split date, time and AM-PM strings
				var da:Array=d[0].split('/'); // split date elements from 'MM/dd/yyyy'
				var db:Array=d[1].split(':'); // split time elements from 'HH:mm:ss'
				var dc:String=d[2]; // AM-PM String
				//db[0] += dc == 'PM' ? 12 : 0 ; // ad PM offset
				var date:Date=new Date(int(da[2]), int(da[0]) - 1, int(da[1]), int(db[0]), int(db[1]), int(db[2]));
				return date;
			}

			/*
			* AS Date to FM TimeStamp
			* FM TimeStamp string format: 'MM/dd/yyyy HH:mm:ss,AM/PM'
			* AS DATE object constructor: 'Date(YYYY,MM,dd,hh,mm,ss,ms)'
			*/
			public static function Date2FMtimestamp(date:Date):String
			{
				var str:String='';
				if (date != null)
				{
					str+=(date.getMonth() + 1).toString() + '/';
					str+=date.getDate().toString() + '/';
					str+=date.getFullYear().toString() + ' ';
					//var hour:Number=date.getHours() % 12;
					//if (hour == 0)
					//	hour=12;
					var hour:Number=date.getHours()
					str+=hour + ':';
					str+=date.getMinutes().toString() + ':';
					str+=date.getSeconds().toString();
					//str+=date.getHours() < 12 ? ',AM' : ',PM';
				}
				//trace('DATE-> ' + str);
				return str;
			}

		}

	}

