package spring;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import bean.NcrIssueCommand;

public class NcrIssueCommandValidator implements Validator{

	@Override
	public boolean supports(Class<?> arg0) {
		return NcrIssueCommand.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, 
				"audit_id", "required");
		ValidationUtils.rejectIfEmpty(errors, 
				"ncr_title", "required");
		ValidationUtils.rejectIfEmpty(errors, 
				"ncr_description", "required");		
		
	}
	
}
