class UrlMappings {

	static mappings = {
		"/"(controller:"usageController")
		"/api/translations"(controller:"translations", action: 'index')
	}
}
