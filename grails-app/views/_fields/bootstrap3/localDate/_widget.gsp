<input 
	class="form-control ${attrs?.remove('class')}"
	type="text" 
	name="${prefix}${property}" 
	value="${joda.format(value:"${value}", style:"S-")}"
	datetimepicker
	<%
		def required = attrs?.remove('required')
		if (required && required != 'false') out << ' required="required" '
		
		def datetimepickerOptions = [ format: dateformat.fromStyle(style:'S-'), defaultDate: value?.millis ?: false ]
		datetimepickerOptions.putAll(attrs?.remove('datetimepicker-options') ?: [:])
		out << " datetimepicker-options='"
		out << new grails.converters.JSON(datetimepickerOptions).toString()
		out << "' "
		
		attrs?.each { key, value ->
			out << key
			out << '="'
			out << value
			out << '" '
		}
	%>
></input>