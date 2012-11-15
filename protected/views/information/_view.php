<?
	$headerLevel = 4 + $level;
	?>
	<? foreach ($data/*->Informations*/ as $information): ?>
		
		<?
		$inf_model = Information::model()->findByPk($information['INF_ID']);
		?>
		
		<? echo "<h".$headerLevel.">".$information['INF_NAME']."</h".$headerLevel.">"; ?>
		<? echo $information['INF_CONTENT']; ?>
		<? if (Yii::app()->user->checkAccess('admin')): ?>
			<?php $this->renderPartial('//information/_edit_link', array('id'=>$information->INF_ID)); ?>
		<? endif; ?>

		<?
		if (count($information->Projects) > 0)
			$this->renderPartial('//project/_view', array('data'=>$information->Projects));
		?>
		
		<?
		if (count($information->Files) > 0)
			$this->renderPartial('//file/_view_link', array('data'=>$information->Files));
		?>
		
		<? if (count($inf_model->Informations) > 0) : ?>
		
			<? //var_dump($inf_model->Informations); ?>
			<?php $this->renderPartial('_view', array('data'=>$inf_model->Informations, 'level'=>($level+1))); ?>
		
		<? endif; ?>
		
	<? endforeach; ?>