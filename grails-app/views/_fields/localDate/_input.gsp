<input 
	class="form-control" 
	type="text" 
	name="${prefix}${property}" 
	value="${joda.format(value:"${value}", style:"S-")}"
	style="position: relative"
	datetimepicker
	datetimepicker-options="{format: '${dateformat.fromStyle(style:'S-')}', defaultDate: ${value?.millis ?: 'false'}}"
	${required ? raw('required="required"') : ''}
	<%/*
		attrs?.each { key, value ->
				out << key
				out << '="'
				out << value
				out << '" '
		}*/
	%>
></input>