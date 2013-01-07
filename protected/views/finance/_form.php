<?php $form=$this->beginWidget('bootstrap.widgets.BootActiveForm',array(
	'id'=>'finance-form',
	'enableAjaxValidation'=>false,
)); ?>

	<div class="alert alert-warning">Pola oznaczone <span class="required">*</span> są wymagane</div>

	<?php echo $form->errorSummary($model,null,null,array('class'=>'alert alert-error')); ?>
	
	<div class='control-group<?php echo (CHtml::error($model,'FIN_TYPE') == '' ? '' : ' error'); ?>'>
		<?php echo $form->labelEx($model,'FIN_TYPE',array('class'=>'control-label')); ?>
		<div class="controls">
		<?php echo $form->dropDownList($model, 'FIN_TYPE', 
			FinanceType::GetFinanceTypeArray()
			); ?>
		<?php echo $form->error($model,'FIN_TYPE',array('class'=>'help-inline')); ?>
		</div>
	</div>

	<div class='control-group<?php echo (CHtml::error($model,'FIN_SOURCE') == '' ? '' : ' error'); ?>'>
		<?php echo $form->labelEx($model,'FIN_SOURCE',array('class'=>'control-label')); ?>
		<div class="controls">
		<?php echo $form->dropDownList($model, 'FIN_SOURCE', 
			FinanceSource::GetFinanceSourceArray()
			); ?>
		<?php echo $form->error($model,'FIN_SOURCE',array('class'=>'help-inline')); ?>
		</div>
	</div>

	<div class='control-group<?php echo (CHtml::error($model,'FIN_YEAR') == '' ? '' : ' error'); ?>'>
		<?php echo $form->labelEx($model,'FIN_YEAR',array('class'=>'control-label')); ?>
		<div class="controls">
		<?php echo $form->textField($model,'FIN_YEAR'); ?>
		<?php echo $form->error($model,'FIN_YEAR',array('class'=>'help-inline')); ?>
		</div>
	</div>

	<div class='control-group<?php echo (CHtml::error($model,'FIN_AMOUNT') == '' ? '' : ' error'); ?>'>
		<?php echo $form->labelEx($model,'FIN_AMOUNT',array('class'=>'control-label')); ?>
		<div class="controls">
		<?php echo $form->textField($model,'FIN_AMOUNT'); ?>
		<?php echo $form->error($model,'FIN_AMOUNT',array('class'=>'help-inline')); ?>
		</div>
	</div>

	<div class='control-group<?php echo (CHtml::error($model,'FIN_FROM') == '' ? '' : ' error'); ?>'>
		<?php echo $form->labelEx($model,'FIN_FROM',array('class'=>'control-label')); ?>
		<div class="controls">
		<?php echo $form->textField($model,'FIN_FROM',array('size'=>60,'maxlength'=>256)); ?>
		<?php echo $form->error($model,'FIN_FROM',array('class'=>'help-inline')); ?>
		</div>
	</div>

	<div class='control-group<?php echo (CHtml::error($model,'FIN_PRJ_ID') == '' ? '' : ' error'); ?>'>
		<?php echo $form->labelEx($model,'FIN_PRJ_ID',array('class'=>'control-label')); ?>
		<div class="controls">
		<?php echo $form->dropDownList($model, 'FIN_PRJ_ID', CHtml::listData(
			Project::model()->findAll(), 'PRJ_ID', 'PRJ_NAME')
			, array('prompt' => '')
			);?>
		<?php echo $form->error($model,'FIN_PRJ_ID',array('class'=>'help-inline')); ?>
		</div>
	</div>

	<div class="form-actions">
		<?php $this->widget('bootstrap.widgets.BootButton', array(
			'buttonType'=>'submit',
			'type'=>'primary',
			'label'=>$model->isNewRecord ? 'Zapisz' : 'Zapisz Zmiany',
		)); ?>
	</div>

<?php $this->endWidget(); ?>