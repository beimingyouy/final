package com.zy.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.context.support.DefaultMessageSourceResolvable;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;


public class AjaxDataComponent {

	public AjaxDataComponent() {
	}

	public String getByCode(String code) {
		String msg = messageSource.getMessage(code, new Object[0],
				LocaleContextHolder.getLocale());
		if (msg == null)
			return "the code do not find value.";
		else
			return msg;
	}

	public  String getByCode(String code, Object params[]) {
		String msg = messageSource.getMessage(code, params,
				LocaleContextHolder.getLocale());
		if (msg == null)
			return "the code do not find value.";
		else
			return msg;
	}

	public AjaxData createError() {
		AjaxData ajaxData = new AjaxData();
		ajaxData.setCode("E1000");
		return ajaxData;
	}

	public AjaxData createErrorCode(String code) {
		return createErrorCode(code, null);
	}

	public AjaxData createErrorCode(String code, String params[]) {
		String errorText = getByCode(code, params);
		return createError(code, errorText);
	}

	public AjaxData createError(String errorText) {
		return createError("E1000", errorText);
	}

	public AjaxData createError(String code, String errorText) {
		AjaxData ajaxData = new AjaxData();
		ajaxData.setCode(code);
		ajaxData.setErrorText(errorText);
		return ajaxData;
	}

	public AjaxData createError(Exception e) {
		return createError(e.getMessage());
	}

	public AjaxData createError(BindingResult result) {
		AjaxData ajaxData = createError();
		List objectErrors = result.getAllErrors();
		Map er = new HashMap();
		int i = 0;
		for (int s = objectErrors.size(); i < s; i++) {
			ObjectError o = (ObjectError) objectErrors.get(i);
			System.out.println(StringUtils.arrayToDelimitedString(
					o.getArguments(), ","));
			System.out.println(o.getArguments()[0].getClass());
			Object obj = o.getArguments()[0];
			if (obj instanceof DefaultMessageSourceResolvable) {
				DefaultMessageSourceResolvable dmsr = (DefaultMessageSourceResolvable) obj;
				String fn = dmsr.getDefaultMessage();
				er.put(fn, o.getDefaultMessage());
			} else {
				er.put(String.valueOf(i), o.getDefaultMessage());
			}
		}

		ajaxData.setErrorText(er);
		return ajaxData;
	}

	public AjaxData createSuccess() {
		AjaxData ajaxData = new AjaxData();
		ajaxData.setCode("S1000");
		return ajaxData;
	}

	public AjaxData createSuccess(Object data) {
		AjaxData ajaxData = createSuccess();
		ajaxData.setData(data);
		return ajaxData;
	}

	public AjaxData createSuccess(List rows, Integer total) {
		AjaxData ajaxData = createSuccess();
		ajaxData.setRows(rows);
		ajaxData.setTotal(total);
		return ajaxData;
	}

	private MessageSource messageSource;
}