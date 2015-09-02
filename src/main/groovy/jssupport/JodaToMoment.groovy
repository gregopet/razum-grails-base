package jssupport

import groovy.transform.CompileStatic

@CompileStatic
class JodaToMoment {

	/**
	 * Convert a time format compatible with DateTimeFormat to a Moment.js format
	 * @param jFormat The original format string from JodaTime
	 * @return A Moment.js compatible time format
	 */
	static String convertFormat(String jFormat) {
		//d is day-of-week, replace with D
		//a is lowercase AM/PM, replace with A
		jFormat = jFormat.tr("da", "DA")

		//moment uses uppercase Y + only recognizes 2 or 4 of them
		//shorthand y from Joda converts to YYYY in moment
		jFormat = jFormat.replace("yyyy", "YYYY")
		jFormat = jFormat.replace("yyy", "YYYY")
		jFormat = jFormat.replace("yy", "YY")
		jFormat = jFormat.replace("y", "YYYY")

		return jFormat
	}
}