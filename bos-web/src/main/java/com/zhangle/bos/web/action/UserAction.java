package com.zhangle.bos.web.action;

import com.zhangle.bos.domain.TUserEntity;
import com.zhangle.bos.service.impl.IUserService;
import com.zhangle.bos.web.action.base.BaseAction;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * Created by Administrator on 2017/10/14.
 */
@Controller
@Scope("prototype")
public class UserAction extends BaseAction<TUserEntity> {




    public String checkCode;

    @Autowired
    public IUserService userService;



    public void setCheckcode(String checkcode) {
        this.checkCode = checkcode;
    }




    public  String login(){


        String vaild = (String) ServletActionContext.getRequest().getSession().getAttribute("key");
        if(StringUtils.isNoneBlank(checkCode)&&checkCode.equals(vaild)){



          TUserEntity userEntity=userService.login(model);
          if(userEntity!=null){
              ServletActionContext.getRequest().getSession().setAttribute("login",userEntity);
                return HOME;
          }else{
              this.addActionError("用户名或者密码输入错误!");
              return LOGIN;
          }

        }else{
            this.addActionError("输入的验证码错误");
            return LOGIN;
        }


    }





}
