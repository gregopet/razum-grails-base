<g:select
	class="form-control"
	name="${prefix}${property}"
	from="${type.values()}"
	value="${value}"
	valueMessagePrefix="${grails.plugin.formfields.FormFieldsTemplateService.toPropertyNameFormat(type)}"
/>
