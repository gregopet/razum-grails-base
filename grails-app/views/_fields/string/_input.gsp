<input 
	class="form-control" 
	type="text" 
	name="${prefix}${property}" 
	value="${value}" 
	${required ? raw('required="required"') : ''}
></input>