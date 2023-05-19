<template>
  <van-cell center title="AI推荐">
    <template #right-icon>
      <van-switch v-model="isMatchMode" size="20"/>
    </template>
  </van-cell>
  <user-card-list :user-list="userList" :loading="loading"/>
  <van-empty v-if="!userList || userList.length < 1" description="数据为空"/>
  <div class="pagination" v-if="userList.length!=10">
    <van-pagination v-model="currentPage" :total-items="totalItems" :items-per-page="pageSize" />
  </div>
</template>

<script setup lang="ts">
import {onMounted, ref, watchEffect} from 'vue';
import myAxios from "../plugins/myAxios";
import {Toast} from "vant";
import UserCardList from "../components/UserCardList.vue";
import {UserType} from "../models/user";
import {getCurrentUser} from "../services/user";

const isMatchMode = ref<boolean>(false);
const currentUser = ref();
const userList = ref([]);
const loading = ref(true);
const currentPage = ref(1);
const totalItems=ref(5);
const pageSize=ref(5);


/**
 * 加载数据
 */
const loadData = async () => {
  let userListData;
  loading.value = true;
  // 心动模式，根据标签匹配用户
  if (isMatchMode.value) {
    const num = 10;
    userListData = await myAxios.get('/user/match', {
      params: {
        num,
      },
    })
        .then(function (response) {
          //console.log('/user/match succeed', response);
          return response?.data;
        })
        .catch(function (error) {
          //console.error('/user/match error', error);
          Toast.fail('请求失败');
        })
  } else {
    // 普通模式，直接分页查询用户
    userListData = await myAxios.get('/user/recommend', {
      params: {
        pageSize: pageSize.value,
        pageNum: currentPage.value,
      },
    })
        .then(async function (response) {
            //console.log('/user/recommend succeed', response);
            currentUser.value = await getCurrentUser();
            if (currentUser.value.userRole === 0 && response?.data.total >= 50) {
                totalItems.value = 50;
            } else {
                totalItems.value = response?.data.total;
            }
            return response?.data?.records;
        })
        .catch(function (error) {
          console.error('/user/recommend error', error);
          Toast.fail('请先登录！');
        })
  }
  if (userListData) {
    userListData.forEach((user: UserType) => {
      if (user.tags) {
        user.tags = JSON.parse(user.tags);
      }
    })
    userList.value = userListData;
  }
  loading.value = false;
}

watchEffect( () => {
    loadData();

})

</script>

<style scoped>
.pagination{
  margin-bottom: 0 ;
}
</style>
