import org.springframework.web.servlet.support.RequestContextUtils
import org.joda.time.format.DateTimeFormat
import jssupport.JodaToMoment

class DateFormatTagLib {
	static namespace = "dateformat"
	
	/**
	 * Outputs the date format for the current culture and for a given style, converts it to Moment.js format.
	 * @param style The style to use, see http://joda-time.sourceforge.net/apidocs/org/joda/time/format/DateTimeFormat.html#forStyle(java.lang.String)
	 */
	def fromStyle = { attrs ->
		def style = attrs.style ?: 'SS'
		out << JodaToMoment.convertFormat(DateTimeFormat.patternForStyle(style, RequestContextUtils.getLocale(request)))
	}
}