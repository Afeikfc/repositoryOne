<template>
  <van-row justify="center">
    <van-form @submit="onSubmit">
      <!-- 居中 -->
      <van-row justify="center">
        <van-image
            :src="friend"
            height="6rem"
            position="center"
            round
            width="6rem"/>
        <h3>乐在相知</h3>
      </van-row>
      <van-divider/>
      <van-cell-group inset>
        <van-field
            v-model="userAccount"
            :rules="[{ required: true, message: '请填写用户名' }]"
            label="账号"
            name="userAccount"
            placeholder="请输入账号"
        />
        <van-field
            v-model="userPassword"
            :rules="[{ required: true, message: '请填写密码' }]"
            label="密码"
            name="userPassword"
            placeholder="请输入密码"
            type="password"
        />
      </van-cell-group>
      <van-divider/>
      <div style="margin: 16px;">
        <van-button block native-type="submit" round type="primary">
          登录
        </van-button>
      </div>
      <van-cell title="" to="/user/regedit" value="没有账号？注册"></van-cell>

    </van-form>
  </van-row>
</template>

<script lang="ts" setup>
import {useRoute, useRouter} from "vue-router";
import {ref} from 'vue';
import myAxios from "../plugins/myAxios";
import {Toast} from "vant";
import friend from '../assets/logo.png';

const router = useRouter();
const route = useRoute();
const userAccount = ref('');
const userPassword = ref('');
const onSubmit = async () => {
  const res:any = await myAxios.post("/user/login", {
    userAccount: userAccount.value,
    userPassword: userPassword.value
  })
  // console.log(res)
  if (res.code === 0 && res.data) {
    Toast.success("登录成功！");
    const redirectUrl = route.query?.redirect as string ?? '/';
    window.location.href = redirectUrl;
    // router.replace("/");
  } else {
    Toast.fail("登录失败！" + res.description);
  }
};

</script>

<style scoped>
h3{
  display: block;
  font-size: 1.5em;
  font-weight: bold;
}
</style>
