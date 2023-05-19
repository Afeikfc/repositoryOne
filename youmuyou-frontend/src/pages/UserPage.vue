<template>
  <template v-if="user">
    <van-cell-group inset>
      <van-cell to="/user/update">
        <van-card
            :thumb="user.avatarUrl"
            :title="user?.username"
             style="--van-card-thumb-size: 170px;--van-card-font-size:17px; --van-card-padding:20px;"
        >
          <template #tags>
            <van-tag v-for="tag in user.tags" plain style="margin-right: 8px;margin-top: 8px" type="danger">{{
                tag
              }}
            </van-tag>

          </template>
        </van-card>

        <van-notice-bar scrollable background="#ecf9ff" color="#1989fa" speed="80"
            :text="user.profile"
        />
      </van-cell>

      <van-grid direction="horizontal" :column-num="2" icon-size="50px"  style="--van-grid-item-text-font-size:15px" >
        <van-grid-item icon="http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202303071914374.png" text="创建" to="/user/team/create"/>
        <van-grid-item icon="http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202303071913683.png" text="加入" to="/user/team/join"/>
        <van-grid-item icon="http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202303071910696.png" text="私有" to="/user/team/private"/>
        <van-grid-item icon="http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202303071912592.png" text="退出" @click="quit"/>
      </van-grid>
    </van-cell-group>
  </template>
</template>

<script lang="ts" setup>
import {useRouter} from "vue-router";
import {onMounted, ref} from "vue";
import {getCurrentUser} from "../services/user";
import myAxios from "../plugins/myAxios";
import {Toast} from "vant";


const user = ref();

onMounted(async () => {
  user.value = await getCurrentUser();
  if (user.value.tags) {
    user.value.tags = JSON.parse(user.value.tags);
  }
})

const router = useRouter();

const quit = async () => {
  const res:any = await myAxios.post("/user/logout");
  if (res.code === 0) {
    Toast.success("退出成功");
    router.push({
      path: '/user/login',
    })
  }
}
</script>

<style scoped>

</style>
