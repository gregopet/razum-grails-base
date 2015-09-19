<textarea
	class="form-control ${attrs?.remove('class')}"
	name="${prefix}${property}" 
	rows="3"
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
>${value}</textarea>