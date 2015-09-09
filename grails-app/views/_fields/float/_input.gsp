<input 
	class="form-control" 
	type="number"
	name="${prefix}${property}" 
	value="${value}" 
	step="any"
	${required ? raw('required="required"') : ''}
></input>