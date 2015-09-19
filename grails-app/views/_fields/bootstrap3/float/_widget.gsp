<input 
	class="form-control ${attrs?.remove('class')}" 
	type="number"
	name="${prefix}${property}" 
	value="${value}" 
	step="any"
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