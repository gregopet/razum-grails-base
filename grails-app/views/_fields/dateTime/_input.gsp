<input 
	class="form-control" 
	type="text" 
	name="${prefix}${property}" 
	value="${joda.format(value:"${value}", style:"SS")}"
	datetimepicker
	datetimepicker-options="{format: '${dateformat.fromStyle(style:'SS')}', defaultDate: ${value?.millis ?: 'false'}"
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