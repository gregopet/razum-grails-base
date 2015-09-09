<input 
	class="form-control" 
	type="number"
	name="${prefix}${property}" 
	value="${value}" 
	${required ? raw('required="required"') : ''}
></input>