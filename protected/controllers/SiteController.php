<?php

class SiteController extends Controller
{
	/**
	 * Declares class-based actions.
	 */
	public function actions()
	{
		return array(
			// captcha action renders the CAPTCHA image displayed on the contact page
			'captcha'=>array(
				'class'=>'CCaptchaAction',
				'backColor'=>0xFFFFFF,
			),
			// page action renders "static" pages stored under 'protected/views/site/pages'
			// They can be accessed via: index.php?r=site/page&view=FileName
			'page'=>array(
				'class'=>'CViewAction',
			),
		);
	}
	
	public function actionGetCookies()
	{
		$cookieName = "getCookies".Yii::app()->request->subdomain;
		$value = isset(Yii::app()->request->cookies[$cookieName]) ? Yii::app()->request->cookies[$cookieName]->value : '0';
		if ($value != '1')
		{
			$cookie = new CHttpCookie($cookieName, '1');
			$cookie->expire = time()+60*60*24*365*5; 
			Yii::app()->request->cookies[$cookieName] = $cookie;
		}
		$this->redirect(array('/Site/index'));
	}

	/**
	 * This is the default 'index' action that is invoked
	 * when an action is not explicitly requested by users.
	 */
	public function actionIndex()
	{
		$this->redirect(array('/Sites/view', 'id'=>'1'));
	}
	
	public function actionSearch()
	{
		$this->render('search');
	}
	
	public function actionSearchResult()
	{
		if (isset($_POST['searchfrase']))
		{
			$phrase = strtolower($_POST['searchfrase']);
			$this->render('searchResult', array(
				'dataProvider'=>Information::model()->UserFind($phrase),
				'dataProviderNews'=>News::model()->UserFind($phrase),
				'dataProviderProject'=>Project::model()->UserFind($phrase),
				'dataProviderControl'=>ExternalControl::model()->UserFind($phrase),
				'dataProviderFile'=>File::model()->UserFind($phrase),
				'phrase'=>$_POST['searchfrase'],
			));
		}
		else
			$this->actionSearch();
	}
	
	public function actionContrast()
	{
		//$this->render('index',array());
		$value = isset(Yii::app()->request->cookies['contrast']) ? Yii::app()->request->cookies['contrast']->value : 'normal';
		if ($value == 'high')
			unset(Yii::app()->request->cookies['contrast']);
		else
			Yii::app()->request->cookies['contrast'] = new CHttpCookie('contrast', 'high', null);
		
		$this->redirect(array('/Sites/view', 'id'=>'1'));
	}

	/**
	 * This is the action to handle external exceptions.
	 */
	public function actionError()
	{
	    if($error=Yii::app()->errorHandler->error)
	    {
	    	if(Yii::app()->request->isAjaxRequest)
	    		echo $error['message'];
	    	else
	        	$this->render('error', $error);
	    }
	}
	
	/**
	 * Displays the login page
	 */
	public function actionLogin0000183154()
	{
		$model=new LoginForm;

		// if it is ajax validation request
		if(isset($_POST['ajax']) && $_POST['ajax']==='login-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}

		// collect user input data
		if(isset($_POST['LoginForm']))
		{
			$model->attributes=$_POST['LoginForm'];
			// validate user input and redirect to the previous page if valid
			if($model->validate() && $model->login())
				$this->redirect(Yii::app()->user->returnUrl);
		}
		// display the login form
		$this->render('login0000183154',array('model'=>$model));
	}

	/**
	 * Logs out the current user and redirect to homepage.
	 */
	public function actionLogout()
	{
		Yii::app()->user->logout();
		$this->redirect(Yii::app()->homeUrl);
	}
}