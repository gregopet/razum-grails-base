# Defines a translationService that fetches translations from the server.
# It is possible to define messagePrefix and language as constants on the common module
# via the defaultLanguage constant object!
# Call it using:
# translationService.translatorPromise.then (translator) -> translator.forCode(code, args)
# Or better yet: just use code="translation.code" attribute on an element you need translated
# together with an 'args' attribute if you need them (args contain placeholder values).
# TODO: make the API more elegant?
serviceDependencies = ['$http', '$q', '$injector']

class TranslationService
	constructor: (@http, @q, injector) ->
		@language = null
		@messagePrefix = null
		
		# were the language and prefix defined as Angular constants?
		language = undefined
		prefix = undefined
		
		if injector.has('defaultLanguage')
			defaultLanguage = injector.get('defaultLanguage')
			language = defaultLanguage.language
			prefix = defaultLanguage.messagePrefix

		# get initial language
		@setLanguageAndPrefix(prefix, language)
	
	# When this method is called it fetches the translations for the given language & prefix
	# Ommiting them will return the default messages (language defined by server, prefix = 'js.')
	# If messagePrefix is not specified, the language cannot be set either!
	setLanguageAndPrefix: (messagePrefix, language) =>
		url = '/api/translations'
		if messagePrefix
			url = url + "/#{messagePrefix}"
			if language
				url = url + "/#{language}"
				
		# Get the messages!
		translatorDefer = @q.defer()
		@translatorPromise = translatorDefer.promise
		translationsPromise = @http
			method: 'GET'
			url: url
		translationsPromise.then (translations) =>
			translatorDefer.resolve(new Translator(translations.data))
	
	# Get the translator object which enables users to translate strings
	translator: () -> @translatorPromise.promise
		
class Translator
	constructor: (@translations) ->
		
	forCode: (code, args = []) -> 
		translation = @translations[code]
		if translation
			for arg,i in args
				translation = translation.replace new RegExp("[{]#{i}[}]", "g"), arg
			return translation
		else
			console.error "Missing translation for code #{code}", @translations
			return code

angular.module('razum-base').service 'translationService', [serviceDependencies..., TranslationService]


