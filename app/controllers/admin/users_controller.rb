class Admin::UsersController < ApplicationController
    
def check
    @user = User.find(params[:user_id])
    #ユーザーの情報を見つける
end

def withdrawl
    @user = User.find(params[:user_id])
    #現在ログインしているユーザーを@userに格納
    @user.update(is_deleted: "Invalid")
    #updateで登録情報をInvalidに変更
    redirect_to admin_path
    #指定されたrootへのpath
end

private

def user_params
    params.require(:user).permit(:deleted)
end

end
