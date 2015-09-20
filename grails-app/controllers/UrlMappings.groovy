class UrlMappings {

	static mappings = {
		"/api/translations"(controller:"translations", action: 'index')
		"/"(controller:"razumGrailsBase", action: 'index')
	}
}
