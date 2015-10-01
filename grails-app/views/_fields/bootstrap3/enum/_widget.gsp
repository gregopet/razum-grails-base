<%
	def params = [
		'class': 'form-control ' + attrs?.remove('class'),
		name: prefix+property,
		from: type.values(),
		value: value,
		valueMessagePrefix:grails.plugin.formfields.FormFieldsTemplateService.toPropertyNameFormat(type)
	]
	def required = attrs?.remove('required')
	if (required && required != 'false') params.required="required"
	
	params.putAll(attrs ?: [:])
%>
${raw(g.select(params))}