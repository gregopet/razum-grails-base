<input 
	class="form-control ${attrs?.remove('class')}"
	type="text" 
	name="${prefix}${property}" 
	value="${joda.format(value:"${value}", style:"S-")}"
	datetimepicker
	datetimepicker-options="{format: '${dateformat.fromStyle(style:'S-')}', defaultDate: ${value?.millis ?: 'false'}}"
	<%
		def required = attrs?.remove('required')
		if (required && required != 'false') out << ' required="required" '
		
		
		attrs?.each { key, value ->
			out << key
			out << '="'
			out << value
			out << '" '
		}
	%>
></input>