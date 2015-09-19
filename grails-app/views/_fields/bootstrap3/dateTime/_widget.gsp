<input 
	class="form-control ${attrs?.remove('class')}" 
	type="text" 
	name="${prefix}${property}" 
	value="${joda.format(value:"${value}", style:"SS")}"
	datetimepicker
	datetimepicker-options="{format: '${dateformat.fromStyle(style:'SS')}', defaultDate: ${value?.millis ?: 'false'}}"
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