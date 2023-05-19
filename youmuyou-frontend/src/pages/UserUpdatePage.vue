<template>
  <template v-if="user">
    <van-cell-group inset>
      <van-divider/>
      <van-cell :value="user.userAccount" center title="账号"/>
      <van-cell center is-link title="头像" to="/user/edit" @click="toEdit(user.id,'avatarUrl', '头像', user.avatarUrl)">
        <van-image
            round
            width="4rem"
            height="4rem"
            :src="user.avatarUrl"
        />
      </van-cell>
      <van-cell :value="user.username" center is-link title="昵称" to="/user/edit"
                @click="toEdit(user.id,'username', '昵称', user.username)"/>
      <van-cell :value="user.profile" center is-link title="个性签名" to="/user/edit"
                @click="toEdit(user.id,'profile', '个性签名', user.profile)"/>
      <van-cell :value="user.gender===1? '男':'女'" center is-link title="性别"
                @click="showGenderEdit=true"/>
      <!--      toEdit('gender', '性别', user.gender)-->
      <van-cell center is-link title="修改标签" @click="toEdit(user.id,'tags', '标签', user.tags)"/>
      <van-cell :value="user.phone" center is-link title="电话" to="/user/edit"
                @click="toEdit(user.id,'phone', '电话', user.phone)"/>
      <van-cell :value="user.email" center is-link title="邮箱" to="/user/edit"
                @click="toEdit(user.id,'email', '邮箱', user.email)"/>
      <van-cell center style="--van-cell-text-color: red" is-link title="注销账号" @click="toCancel()"/>
    </van-cell-group>
    <van-dialog v-model:show="showGenderEdit" show-cancel-button title="性别" @confirm="doEditGender()">
      <van-row justify="center">
        <van-radio-group v-model="gender" direction="horizontal">
          <van-radio name="1">男</van-radio>
          <van-radio name="0">女</van-radio>
        </van-radio-group>
      </van-row>
    </van-dialog>
  </template>
</template>

<script lang="ts" setup>
import {useRoute, useRouter} from "vue-router";
import {onMounted, ref} from "vue";
import {getCurrentUser} from "../services/user";
import myAxios from "../plugins/myAxios";
import {Dialog, Toast} from "vant";

const route = useRoute();
const user = ref();
const id = route.query.id;
const showGenderEdit = ref(false);
const router = useRouter();
const gender = ref();
onMounted(async () => {
  console.log(id);
  if (id != null) {
    const res:any = await myAxios.post('/user/currentbyid', {
      'id': id,
    });
    if (res.code === 0) {
      user.value = res.data;
    }


  } else {
    user.value = await getCurrentUser();
  }
  gender.value = user.value.gender + '';
})

const toCancel = async () => {
  const currentUser = await getCurrentUser();
  if (!currentUser) {
    Toast.fail('用户未登录');
    return;
  }

  if(id === undefined){
    Dialog.confirm({
      title: '注销须知',
      message:
          '您的帐号一旦被注销成功将不可恢复，您将无法再使用本帐号或找回您添加、绑定的任何本帐号内容或信息。同时注销帐号并不代表帐号注销前的行为和相关责任得到任何形式的豁免或减轻。\n' +
          '注销成功后，我们将删除您的个人信息或对其进行匿名化处理。请您知悉并理解，根据相关法律法规规定，本系统将就相关日志记录保留不少于 6 个月的时间。请问你确认注销吗？',
    })
        .then(async () => {

          const res:any = await myAxios.post('/user/cancel', {
            'id': currentUser.id,
          });
          if (res.code === 0) {
            await router.push({
              path: '/user/login',
            })
          }
        })
        .catch(() => {
          // on cancel
        });
  }else {
    return;
  }
}

const toEdit = (editId: number,editKey: string, editName: string, currentValue: string) => {
  if (editKey === 'tags') {
    if (currentValue == null) {
      currentValue = '';
    }
    router.push({
      path: '/user/updateTags',
      query: {
        editId,
        currentValue,
      }
    })
  } else {
    router.push({
      path: '/user/edit',
      query: {
        editId,
        editKey,
        editName,
        currentValue,
      }
    })
  }
}

const doEditGender = async () => {
  const res:any = await myAxios.post("/user/update", {
    'id': user.value.id,
    'gender': gender.value,
  })
  if (res.code === 0 && res.data > 0) {
    Toast.success("修改成功！");
    window.location.reload();
  } else {
    Toast.fail("更新失败！");
  }
}
</script>

<style scoped>

</style>
