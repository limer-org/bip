<?php

/**
 * This is the model class for table "inf".
 *
 * The followings are the available columns in table 'inf':
 * @property integer $INF_ID
 * @property string $INF_NAME
 * @property string $INF_CONTENT
 * @property integer $INF_OBLIGATORY
 * @property integer $INF_SHOW
 * @property integer $INF_BIP
 * @property integer $INF_SIT_ID
 * @property integer $INF_TYPE
 * @property integer $INF_INF_ID
 * @property integer $INF_SHOW_PRJ_CAT
 * @property integer $INF_SHOW_FILE_CAT
 * @property integer $INF_SHOW_FIN_TYPE
 * @property integer $INF_SHOW_CTRL
 * @property string $INF_CREATE_DATE
 * @property integer $INF_CREATE_BY
 * @property string $INF_MODIFY_DATE
 * @property integer $INF_MODIFY_BY
 *
 * The followings are the available model relations:
 * @property Sit $iNFSIT
 * @property Usr $iNFCREATEBY
 * @property Usr $iNFMODIFYBY
 * @property InfHist[] $infHists
 */
class Information extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Information the static model class
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
		return 'inf';
	}
	
	private $_old;
	
	public function beforeSave()
	{
		$this->_old = Information::model()->findByPk($this->INF_ID);
		if ($this->INF_CONTENT == "" || $this->INF_CONTENT == null)
		{
			$this->INF_CONTENT = "<span></span>";
		}
		return parent::beforeSave();
	}
	
	public function afterSave()
	{
		if ($this->_old != null && ($this->_old->INF_CONTENT != $this->INF_CONTENT))
		{
			$historyEntry = new InformationHistory;
			
			$historyEntry->INF_HIST_INF_ID = $this->_old->INF_ID;
			$historyEntry->INF_CONTENT = $this->_old->INF_CONTENT;
			$historyEntry->INF_MODIFY_DATE = $this->INF_MODIFY_DATE;
			$historyEntry->INF_MODIFY_BY = $this->INF_MODIFY_BY;
			
			$historyEntry->save();
		}
		
		parent::afterSave();
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('INF_DISPLAY_ORDER, INF_SIT_ID, INF_APP_ID, INF_CREATE_DATE, INF_CREATE_BY', 'required'),
			array('INF_OBLIGATORY, INF_DISPLAY_ORDER, INF_SHOW, INF_BIP, INF_SIT_ID, INF_TYPE, INF_INF_ID, INF_SHOW_PRJ_CAT, INF_SHOW_FILE_CAT, INF_SHOW_FIN_TYPE, INF_SHOW_CTRL, INF_APP_ID, INF_CREATE_BY, INF_MODIFY_BY', 'numerical', 'integerOnly'=>true),
			array('INF_NAME, INF_INFO_CREATED_BY', 'length', 'max'=>256),
			array('INF_CONTENT, INF_MODIFY_DATE, INF_INFO_CREATE_DATE', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('INF_ID, INF_NAME, INF_CONTENT, INF_OBLIGATORY, INF_DISPLAY_ORDER, INF_SHOW, INF_BIP, INF_SIT_ID, INF_TYPE, INF_INF_ID, INF_SHOW_PRJ_CAT, INF_SHOW_FILE_CAT, INF_SHOW_FIN_TYPE, INF_SHOW_CTRL, INF_APP_ID, INF_CREATE_DATE, INF_CREATE_BY, INF_MODIFY_DATE, INF_MODIFY_BY, INF_INFO_CREATED_BY, INF_INFO_CREATE_DATE', 'safe', 'on'=>'search'),
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
			'Parent' => array(self::BELONGS_TO, 'Information', 'INF_INF_ID'),
			'Informations' => array(self::HAS_MANY, 'Information', 'INF_INF_ID'),
			'Site' => array(self::BELONGS_TO, 'Site', 'INF_SIT_ID'),
			'CreateBy' => array(self::BELONGS_TO, 'User', 'INF_CREATE_BY'),
			'iNFMODIFYBY' => array(self::BELONGS_TO, 'User', 'INF_MODIFY_BY'),
			'History' => array(self::HAS_MANY, 'InformationHistory', 'INF_HIST_INF_ID'),
		);
	}

	
	public function GetHistoryProvider()
	{
		$params[':INF_HIST_INF_ID'] = $this->INF_ID;
		$condition = "INF_HIST_INF_ID = :INF_HIST_INF_ID";
		
		$criteria = new CDbCriteria(array(
			'condition'=>$condition,
			'params'=>$params
		));
	
		$dataProvider = new CActiveDataProvider('InformationHistory', array(
			'criteria'=>$criteria,
		));
			
		return $dataProvider;
	}

	public function GetInformationsLevel0()
	{
		if(count($this->Informations) > 0)
		{
			$criteria = new CDbCriteria;
			$criteria->condition='INF_INF_ID='.$this->INF_ID;
			$criteria->order='INF_DISPLAY_ORDER';
			return Information::model()->findAll($criteria);
		}
		
		return array();
	}
	
	public function IsProjectsInfo()
	{
		return $this->INF_SHOW_PRJ_CAT != '';
	}
	
	public function GetProjects()
	{
		if ($this->INF_SHOW_PRJ_CAT != '')
		{
			$criteria = new CDbCriteria;
			$criteria->condition='PRJ_CAT='.$this->INF_SHOW_PRJ_CAT.' and PRJ_APP_ID='.Yii::app()->request->subdomainAppId;
			$criteria->order='PRJ_ID desc';
			return Project::model()->findAll($criteria);
		}
		
		return array();
	}
	
	public function GetFiles()
	{
		if ($this->INF_SHOW_FILE_CAT != '')
		{
			$criteria = new CDbCriteria;
			$criteria->condition='FIL_CAT='.$this->INF_SHOW_FILE_CAT.' and FIL_APP_ID='.Yii::app()->request->subdomainAppId;
			$criteria->order='FIL_CREATE_DATE desc';
			return File::model()->findAll($criteria);
		}
		
		return array();
	}
	
	public function GetFinances()
	{
		if ($this->INF_SHOW_FIN_TYPE != '')
		{
			$criteria = new CDbCriteria;
			$criteria->condition='FIN_TYPE='.$this->INF_SHOW_FIN_TYPE.' and FIN_APP_ID='.Yii::app()->request->subdomainAppId;
			$criteria->order='FIN_YEAR DESC, FIN_SOURCE';
			return Finance::model()->findAll($criteria);
		}
		
		return array();
	}
	
	public function GetExternalControls()
	{
		if ($this->INF_SHOW_CTRL != '')
		{
			$criteria = new CDbCriteria;
			$criteria->condition='CTRL_APP_ID='.Yii::app()->request->subdomainAppId;
			$criteria->order='CTRL_YEAR DESC';
			return ExternalControl::model()->findAll($criteria);
		}
		
		return array();
	}
	
	public function GetLink()
	{
		if ($this->INF_TYPE == InformationType::Internal)
			return Yii::app()->createUrl('Sites/view', array('id' => $this->Site->SIT_ID)); 

		if ($this->INF_TYPE == InformationType::External)
			return Yii::app()->createUrl('Information/view', array('id' => $this->INF_ID)); 
	}
	
	public function GetLinkAnchor()
	{
		if ($this->INF_TYPE == InformationType::Internal)
			return Yii::app()->createUrl('Sites/view', array('id' => $this->Site->SIT_ID, "#" => "inf_".$this->INF_ID));

		if ($this->INF_TYPE == InformationType::External)
			return Yii::app()->createUrl('Information/view', array('id' => $this->INF_ID)); 
	}
	
	public function UserFind($phrase)
	{
		$condition = "INF_SHOW = 1 and INF_APP_ID = ".Yii::app()->request->subdomainAppId." and ( LOWER(INF_NAME) like :PHRASE or LOWER(fnStripTags(INF_CONTENT)) LIKE :PHRASE )";
		$params[':PHRASE'] = '%'.$phrase.'%';

		$criteria = new CDbCriteria(array(
				'condition'=>$condition,
				'params'=>$params
			));

		$dataProvider = new CActiveDataProvider('Information', array(
				'criteria'=>$criteria,
				'pagination'=>false,
				// 'pagination'=>array(
					// 'pageSize'=>20,
				// ),
			));
			
		return $dataProvider;
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'INF_ID' => 'Inf',
			'INF_NAME' => 'Inf Name',
			'INF_CONTENT' => 'Treść',
			'INF_OBLIGATORY' => 'Inf Obligatory',
			'INF_DISPLAY_ORDER' => 'Inf Display Order',
			'INF_SHOW' => 'Pokazuj tę informację',
			'INF_BIP' => 'Pokazuj Bip',
			'INF_SIT_ID' => 'Inf Sit',
			'INF_TYPE' => 'Inf Type',
			'INF_INF_ID' => 'Inf Inf',
			'INF_SHOW_PRJ_CAT' => 'Inf Show Prj Cat',
			'INF_SHOW_FILE_CAT' => 'Inf Show File Cat',
			'INF_SHOW_FIN_TYPE' => 'Inf Show Fin Type',
			'INF_SHOW_CTRL' => 'Inf Show Ctrl',
			'INF_APP_ID' => 'App',
			'INF_CREATE_DATE' => 'Data udostępnienia informacji w BIP',
			'INF_CREATE_BY' => 'Informację wprowadził do BIP',
			'INF_MODIFY_DATE' => 'Inf Modify Date',
			'INF_MODIFY_BY' => 'Inf Modify By',
			'INF_INFO_CREATED_BY' => 'Informację wytworzył lub odpowiada za treść',
			'INF_INFO_CREATE_DATE' => 'Data wytworzenia informacji',
			'Podmiot'=>'Podmiot udostępniający informację'
		);
	}
	
	public static function FindByName($name)
	{
		$found=Information::model()->find('INF_NAME=:INF_NAME and INF_APP_ID=:INF_APP_ID', 
		array(':INF_NAME'=>'Pełna nazwa organizacji',':INF_APP_ID'=>Yii::app()->request->subdomainAppId));
		return $found->INF_CONTENT;
	}
	
	public static function FindByProjectType($type) 
	{
		$found=Information::model()->find('INF_SHOW_PRJ_CAT=:INF_SHOW_PRJ_CAT AND INF_APP_ID=:INF_APP_ID', array(':INF_SHOW_PRJ_CAT'=>$type,':INF_APP_ID'=>Yii::app()->request->subdomainAppId));
		return $found;
	}
	
	public static function FindByFinanceType($type) 
	{
		$found=Information::model()->find('INF_SHOW_FIN_TYPE=:INF_SHOW_FIN_TYPE AND INF_APP_ID=:INF_APP_ID', array(':INF_SHOW_FIN_TYPE'=>$type,':INF_APP_ID'=>Yii::app()->request->subdomainAppId));
		return $found;
	}
	
	public static function FindByExternalControl() 
	{
		$found=Information::model()->find('INF_SHOW_CTRL=1 AND INF_APP_ID='.Yii::app()->request->subdomainAppId);
		return $found;
	}
	
	public function GetPodmiot()
	{
		return strip_tags(Information::FindByName('Pełna nazwa organizacji'));
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

		$criteria->compare('INF_ID',$this->INF_ID);
		$criteria->compare('INF_NAME',$this->INF_NAME,true);
		$criteria->compare('INF_CONTENT',$this->INF_CONTENT,true);
		$criteria->compare('INF_OBLIGATORY',$this->INF_OBLIGATORY);
		$criteria->compare('INF_DISPLAY_ORDER',$this->INF_DISPLAY_ORDER);
		$criteria->compare('INF_SHOW',$this->INF_SHOW);
		$criteria->compare('INF_BIP',$this->INF_BIP);
		$criteria->compare('INF_SIT_ID',$this->INF_SIT_ID);
		$criteria->compare('INF_TYPE',$this->INF_TYPE);
		$criteria->compare('INF_INF_ID',$this->INF_INF_ID);
		$criteria->compare('INF_SHOW_PRJ_CAT',$this->INF_SHOW_PRJ_CAT);
		$criteria->compare('INF_SHOW_FILE_CAT',$this->INF_SHOW_FILE_CAT);
		$criteria->compare('INF_SHOW_FIN_TYPE',$this->INF_SHOW_FIN_TYPE);
		$criteria->compare('INF_SHOW_CTRL',$this->INF_SHOW_CTRL);
		$criteria->compare('INF_APP_ID',Yii::app()->request->subdomainAppId);
		$criteria->compare('INF_CREATE_DATE',$this->INF_CREATE_DATE,true);
		$criteria->compare('INF_CREATE_BY',$this->INF_CREATE_BY);
		$criteria->compare('INF_MODIFY_DATE',$this->INF_MODIFY_DATE,true);
		$criteria->compare('INF_MODIFY_BY',$this->INF_MODIFY_BY);
		$criteria->compare('INF_INFO_CREATED_BY',$this->INF_INFO_CREATED_BY,true);
		$criteria->compare('INF_INFO_CREATE_DATE',$this->INF_INFO_CREATE_DATE,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}