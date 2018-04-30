package spring;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import bean.NcrReplyCommand;

public class NcrReplyCommandValidator implements Validator{

	@Override
	public boolean supports(Class<?> arg0) {
		return NcrReplyCommand.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
				"reply_description", "required");
	
		
	}
	
}
