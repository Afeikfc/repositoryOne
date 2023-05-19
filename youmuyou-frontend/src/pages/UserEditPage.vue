<template>
  <van-form @submit="onSubmit">
      <van-field v-if="editUser.editName!=='头像'"
          v-model="editUser.currentValue"
          :name="editUser.editKey"
          :label="editUser.editName"
          :placeholder="`请输入${editUser.editName}`"
      />
    <van-row v-if="editUser.editName==='头像'" justify="center">
      <van-cell center title="头像">
        <!-- 使用 title 插槽来自定义标题 -->
        <template #value>
          <van-uploader v-model="fileList" :after-read="afterRead" max-count="1" multiple/>
        </template>
      </van-cell>

    </van-row>
    <div style="margin: 16px;">
      <van-button round block type="primary" native-type="submit">
        提交
      </van-button>
    </div>
  </van-form>
</template>

<script setup lang="ts">
import {useRoute, useRouter} from "vue-router";
import { ref } from "vue";
import myAxios from "../plugins/myAxios";
import {Toast} from "vant";
import {getCurrentUser} from "../services/user";

const route = useRoute();
const router = useRouter();

const editUser = ref({
  editId:route.query.editId,
  editKey: route.query.editKey,
  currentValue: route.query.currentValue,
  editName: route.query.editName,
})
const fileList = ref([
  {url: editUser.value.currentValue, isImage: true},
]);
const onSubmit = async () => {
  const currentUser = await getCurrentUser();

  if (!currentUser) {
    Toast.fail('用户未登录');
    return;
  }
  // console.log(currentUser, '当前用户');
  const res = await myAxios.post('/user/update', {
    'id': editUser.value.editId,
    [editUser.value.editKey as string]: editUser.value.currentValue,
  })
  // console.log(res, '更新请求');
  const afterRead = async (file) => {
    // console.log(file.file);

    const fileFile = file.file
    const res = await myAxios.post("/file/upload", {
      'file': fileFile
    }, {
      headers: {'Content-Type': 'multipart/form-data'},
    })
    editUser.value.currentValue = res.data;
    // 此时可以自行将文件上传至服务器
    // console.log(res);
    // console.log(editUser.value.currentValue);
  };
  if (res.code === 0 && res.data > 0) {
    Toast.success('修改成功');
    router.back();
  } else {
    Toast.fail('修改错误');
  }
};

const afterRead = async (file: { file: any; }) => {
  // console.log(file.file);

  const fileFile = file.file
  const res = await myAxios.post("/file/upload", {
    'file': fileFile
  }, {
    headers: {'Content-Type': 'multipart/form-data'},
  })
  editUser.value.currentValue = res.data;

};
</script>

<style scoped>

</style>
