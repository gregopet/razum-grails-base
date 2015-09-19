package jssupport
import java.util.Properties
import grails.compiler.GrailsCompileStatic
import groovy.transform.TypeCheckingMode

/**
 * This trait allows us to extract message codes from the I18n system.
 * Usage: ctx.getBean('messageSource').withTraits(MessagePropertiesTrait).messageKeys(locale)
 * (the locale can be obtained using org.springframework.web.servlet.support.RequestContextUtils.getLocale(request))
 */
@GrailsCompileStatic(TypeCheckingMode.SKIP)
trait MessagePropertiesTrait {
	Properties getMessageKeys(Locale locale) {
		this.getMergedProperties(locale).properties
	}
	
	Properties getPluginMessageKeys(Locale locale) {
		this.getMergedPluginProperties(locale).properties
	}
}