<input 
	class="form-control ${attrs?.remove('class')}" 
	type="text" 
	name="${prefix}${property}" 
	value="${value}" 
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