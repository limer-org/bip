<?php

/**
 * This is the model class for table "sit".
 *
 * The followings are the available columns in table 'sit':
 * @property integer $SIT_ID
 * @property string $SIT_NAME
 * @property integer $SIT_BIP
 *
 * The followings are the available model relations:
 * @property Inf[] $infs
 */
class Site extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Site the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'sit';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('SIT_NAME', 'required'),
			array('SIT_BIP', 'numerical', 'integerOnly'=>true),
			array('SIT_NAME', 'length', 'max'=>256),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('SIT_ID, SIT_NAME, SIT_BIP', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'Informations' => array(self::HAS_MANY, 'Information', 'INF_SIT_ID'),
		);
	}
	
	public function GetInformationsLevel0()
	{
		if(count($this->Informations) > 0)
		{
			$criteria = new CDbCriteria;
			$criteria->condition='INF_SIT_ID='.$this->SIT_ID.' and INF_INF_ID is null';
			//$criteria->params=array(':INF_SIT_ID'=>$this->SIT_ID);
			return Information::model()->findAll($criteria);
		}
		
		return array();
	}
	
	public function GetInformationsExternal()
	{
		if(count($this->Informations) > 0)
		{
			$criteria = new CDbCriteria;
			$criteria->condition='INF_SIT_ID='.$this->SIT_ID.' and INF_TYPE = '.InformationType::External;
			//$criteria->params=array(':INF_SIT_ID'=>$this->SIT_ID);
			return Information::model()->findAll($criteria);
		}
		
		return array();
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'SIT_ID' => 'Sit',
			'SIT_NAME' => 'Sit Name',
			'SIT_BIP' => 'Sit Bip',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('SIT_ID',$this->SIT_ID);
		$criteria->compare('SIT_NAME',$this->SIT_NAME,true);
		$criteria->compare('SIT_BIP',$this->SIT_BIP);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}