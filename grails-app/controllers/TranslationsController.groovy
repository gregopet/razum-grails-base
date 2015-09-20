import jssupport.MessagesList
import grails.converters.JSON

class TranslationsController {
    def messageSource

    def index() {
        //implement whatever caching strategy that best suits your app here

        def translations = MessagesList.getMessages(messageSource, request, "razum.grails.base.demo" /* other prefixes interesting to JS.. */)
        render translations as JSON
    }
}