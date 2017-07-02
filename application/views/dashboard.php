<div class="row">
    <div class="col-sm-4">
        <div class="box box-solid">
            <div class="box-body">
                <strong>Database : </strong> <?php echo $database ?>
            </div><!-- /.box-body -->
        </div>
    </div>
</div>

<div class="row margin-top">
    <div class="col-md-4">
        <!-- USERS LIST -->
        <div class="box box-danger">
            <div class="box-header with-border">
                <h3 class="box-title">Latest Members</h3>
                <div class="box-tools pull-right">
                    <span class="label label-danger"><?php echo $total_users ?> New Members</span>
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i>
                    </button>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <ul class="users-list clearfix">
                    <?php foreach ($users as $key => $user) { ?>
                    <li>
                        <?php if (filter_var($user->photo,FILTER_VALIDATE_URL)): ?>
                            <img src="<?php echo $user->photo; ?>" class="img-circle" alt="<?php echo $user->full_name ?>"/>
                        <?php else: ?>
                            <img src="<?php echo $user->photo == '' ? base_url('assets/img/logo/kotaxdev.png') : base_url('assets/uploads/image/'.$user->photo) ?>" class="img-circle" alt="<?php echo $user->full_name ?>"/>
                        <?php endif; ?>
                        <a class="users-list-name" title="<?php echo $user->full_name ?>" href="<?php echo site_url('users/manage_users/edit/'.$user->id) ?>"><?php echo $user->full_name ?></a>
                        <span class="users-list-date"><?php echo time_elapsed_string($user->created_on) ?></span>
                    </li>
                    <?php } ?>
                </ul>
                <!-- /.users-list -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer text-center">
                <a href="<?php echo site_url('users/manage_users') ?>" class="uppercase">View All Users</a>
            </div>
            <!-- /.box-footer -->
        </div>
        <!--/.box -->
    </div>
</div>