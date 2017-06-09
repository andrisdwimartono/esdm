<div class="row">
    <div class="col-sm-4">
        <div class="box box-solid">
            <div class="box-body">
                <strong>Database : </strong> <?php echo $database ?>
            </div><!-- /.box-body -->
        </div>
    </div>
</div>
<div class="row">
    <div class="col-sm-4">
        <a href="<?php echo site_url('admin/crud_builder') ?>" title="CRUD Builder" class="box-feature box-feature-light-blue text-center">
            <i class="fa fa-table fa-3x"></i> <span>CRUD Builder</span>
        </a>    
    </div>
    <div class="col-sm-4">
        <a href="<?php echo site_url('admin/page_builder') ?>" title="Page Builder" class="box-feature box-feature-green text-center">
            <i class="fa fa-file-o fa-3x"></i> <span>Page Builder</span>
        </a>
    </div>
    <div class="col-sm-4">
        <a href="<?php echo site_url('admin/modules') ?>" title="Add Module" class="box-feature box-feature-orange text-center">
            <i class="fa fa-th fa-3x"></i> <span>Module Extensions</span>
        </a>
    </div>
</div>

<div class="row margin-top">
    <div class="col-sm-4">
        <a href="<?php echo site_url('admin/database') ?>" title="Add Table" class="box-feature box-feature-green text-center">
            <i class="fa fa-database fa-3x"></i> <span>Database (<?php echo $database ?>)</span>
        </a>
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
                        <a class="users-list-name" title="<?php echo $user->full_name ?>" href="<?php echo site_url('myigniter/users/edit/'.$user->id) ?>"><?php echo $user->full_name ?></a>
                        <span class="users-list-date"><?php echo time_elapsed_string($user->created_on) ?></span>
                    </li>
                    <?php } ?>
                </ul>
                <!-- /.users-list -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer text-center">
                <a href="<?php echo site_url('admin/users') ?>" class="uppercase">View All Users</a>
            </div>
            <!-- /.box-footer -->
        </div>
        <!--/.box -->
    </div>
</div>