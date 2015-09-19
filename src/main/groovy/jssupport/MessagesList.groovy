package jssupport
import javax.servlet.http.HttpServletRequest
import org.springframework.context.MessageSource
import org.springframework.web.servlet.support.RequestContextUtils as RCU
import grails.compiler.GrailsCompileStatic

/**
 * Assists getting a list of i18n messages out of Spring MessageSource beans.
 */
@GrailsCompileStatic
class MessagesList {
	/**
	* Returns a map of translations whose keys begin with one of the prefixes.
	* @param source The message source bean from which the translations will be taken
	* @param req The request from which the locale will be inferred
	* @param prefixes Messages must match this prefix
	*/
	static Map<String, String> getMessages(MessageSource source, HttpServletRequest req, String... prefixes) {
		def locale = RCU.getLocale(req)
		return getMessages(source, locale, prefixes)
	}
	
	/**
	* Returns a map of translations whose keys begin with one of the prefixes.
	* @param source The message source bean from which the translations will be taken
	* @param locale The locale to get the messages for
	* @param prefixes Messages must match this prefix
	*/
	static Map<String, String> getMessages(MessageSource source, Locale locale, String... prefixes) {
		def keys = (Hashtable<String, String>)source.withTraits(MessagePropertiesTrait).getMessageKeys(locale)
		def matchingKeys = keys.findAll { String code, String value -> prefixes.any { String prefix -> code.startsWith(prefix)} }
	 	return matchingKeys
	}
}