<?php

class SubmitClass
{    
    private $checkValidation = true;
    private $errors = [];
    public function checkValidation(): bool
    {
        return $this->checkValidation;
    }
    
    public function getError($fieldName)
    {
        return isset($this->errors[$fieldName]) ? $this->errors[$fieldName] : '';
    }

    public function validate(array $rules, array $payload)
    {
        foreach ($rules as $rule) {
            if (!$this->validateRequired($rule, $payload)) {
                continue;
            }
            switch ($rule['type']) {
                case 'string':
                    $this->validateString($rule, $payload);
                    break;
                case 'email':
                    $this->validateEmail($rule, $payload);
                    break;
                case 'number':
                    $this->validateNumber($rule, $payload);
                    break;
                    //extend with other validation rules as needed
            }
        }

        return $this->checkValidation();
    }

    public function validateRequired(array $rule, array $payload)
    {
    	foreach ($payload[$rule['fieldName']] as $value) {
	        if (true === $rule['required'] && $value == '') {
	            $this->checkValidation = false;
	            $this->errors[$rule['fieldName']] = $rule['title'].' field is required';
	            return false;
	        }
        }
        return true;
    }

    public function validateString($rule, $payload)
    {
        foreach ($payload[$rule['fieldName']] as $value) {
	        if (is_numeric($value)) {
	            $this->checkValidation = false;
	            $this->errors[$rule['fieldName']] = 'Invalid '.$rule['title'];
	            return false;
	        }
        }
        return true;
    }

    public function validateNumber($rule, $payload)
    {
        foreach ($payload[$rule['fieldName']] as $value) {
	        if (!is_numeric($value) || (strlen($value) != $rule['length'])) {
	            $this->checkValidation = false;
	            $this->errors[$rule['fieldName']] = 'Invalid '.$rule['title'];
	            return false;
	        }
        }
        return true;
    }

    public function validateEmail($rule, $payload)
    {
        foreach ($payload[$rule['fieldName']] as $value) {
            if(!preg_match('/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/', $value)) {
	            $this->checkValidation = false;
	            $this->errors[$rule['fieldName']] = 'Invalid '.$rule['title'];
	            return false;
	        }
        }
        return true;
    }

}

//validator ruleset format

$rules = [
    [
        'fieldName' => 'name',
        'title' => 'Name',
        'type' => 'string',
        'required' => true,
    ],
    [
        'fieldName' => 'email',
        'title' => 'Email',
        'type' => 'email',
        'required' => true,
    ],
	[
        'fieldName' => 'phone',
        'title' => 'Phone Number',
        'type' => 'number',
        'length' => 10,
        'required' => true,
    ],
];

$validator = new SubmitClass();
$checkValidation = $validator->validate($rules, $_POST);

if(!empty($_POST)){
	if($checkValidation) {
		unlink('database/contactData.txt');
		$fp = fopen('database/contactData.txt', 'a');
		fwrite($fp, serialize($_POST));
		fclose($fp);
		$message['success'] = 'Contact Data saved successfully';
	} else {
		$message['name'] = $validator->getError('name');
		$message['email'] = $validator->getError('email');
		$message['phone'] = $validator->getError('phone');
	}
}