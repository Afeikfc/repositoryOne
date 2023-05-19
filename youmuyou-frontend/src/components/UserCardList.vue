<template>
  <van-skeleton title avatar :row="3" :loading="props.loading" v-for="user in props.userList">
    <van-card
        :desc="user.profile"
        :title="`${user.username}`"
        :thumb="user.avatarUrl"

    >
      <template #tags>
        <van-tag plain type="danger" v-for="tag in user.tags" style="margin-right: 8px; margin-top: 8px">
          {{ tag }}
        </van-tag>
      </template>
      <template #footer>
        <van-button size="mini" @click="doUsermes(user)">联系请点击</van-button>
      </template>
    </van-card>
  </van-skeleton>
  <van-popup v-model:show="show" closeable close-icon="close" round position="bottom" @close="doClose" :style="{ height: '70%' } ">

    <van-image round width="6rem" height="6rem" :src="clickUser?.avatarUrl" />
    <van-cell :value="clickUser?.username" center title="姓名:"/>
    <van-divider/>
    <van-cell :value="clickUser?.profile" center title="个性签名:"/>
    <van-cell :value="popupText" center/>
    <van-popover v-model:show="showPopover" placement="right-start">
      <van-grid
          :border="false"
          clickable
          column-num="3"
          square
          style="width: 240px;"
      >
        <van-grid-item
            v-for="operation in operations"
            :icon="operation.icon"
            :text="operation.text"
            @click="doClickEvent(operation.clickEvent)"
        />
      </van-grid>
      <template #reference>
        <van-cell  center title="管理员操作">
          <template #icon>
            <van-icon name="info-o" size="18"/>
          </template>
        </van-cell>
      </template>
    </van-popover>
  </van-popup>
</template>

<script setup lang="ts">

import {UserType} from "../models/user";
import {onMounted, ref} from "vue";
import {useRoute, useRouter} from "vue-router";
import {getCurrentUser} from "../services/user";
import {userRolesEnum} from "../constants/user";
import myAxios from "../plugins/myAxios";
import {Dialog, Toast} from "vant";
const user=ref();
const route = useRoute();
const router = useRouter();
const show = ref(false);
const popupText = ref('暂无联系方式');
const clickUser = ref<UserType>();
const showPopover = ref(false);
const operations = ref([]);
const currentUser = ref();
interface UserCardListProps {
  loading: boolean;
  userList: UserType[];
};
const doClose = () =>{
  showPopover.value=false;
}
const doUsermes = (user: UserType)=>{
  clickUser.value = user;
  if (user.email) {
    popupText.value = '联系邮箱：' + user.email;
  } else {
    popupText.value = '暂无联系方式';
  }
  show.value = true;
}
const props = withDefaults(defineProps<UserCardListProps>(), {
  loading: true,
  // @ts-ignore
  userList: [] as UserType[],
});

onMounted(async () => {
  currentUser.value = await getCurrentUser();
  //管理员更新或者删除队伍！
  if (userRolesEnum[currentUser.value.userRole]==="admin") {
    operations.value.push({text: '更新', clickEvent: "updateUser", icon: "add-o"},{text: '删除', clickEvent: "deleteUser", icon: "delete"});
  }
  if (userRolesEnum[currentUser.value.userRole]==="boss") {
    operations.value.push({text: '更新', clickEvent: "updateUser", icon: "add-o"},{text: '删除', clickEvent: "deleteUser", icon: "delete"},{text: '设为管理员', clickEvent: "doAdminUser", icon: "add-o"});
  }
});

const doClickEvent = (operationName: string) => {
  if (operationName === "updateUser") {
    doUpdateUser(clickUser.value.id);
    // console.log(clickUser.value.id);
  }
  if (operationName === "deleteUser") {
    doDeleteUser(clickUser.value.id);
  }
  if (operationName === "doAdminUser") {
    doAdminUser(clickUser.value.id);
  }
}



/**
 * 跳转至更新用户页面
 * @param id
 */
const doUpdateUser = (id: number) => {
  router.push({
    path: '/user/update',
    query: {
      id,
    }
  })
}


/**
 * 注销用户
 * @param id
 */
const doDeleteUser = async (id: number) => {
  Dialog.confirm({
    title: '注销须知',
    message:
        '管理员，请问你确认注销该用户吗？',
  })
      .then(async () => {

        const res = await myAxios.post('/user/cancel', {
          'id': id,
        });
        if (res.code === 0) {
          Toast.success('注销成功！' + (res.description ? `，${res.description}` : ''));
        }else {
          Toast.fail('注销失败！' + (res.description ? `，${res.description}` : ''));
        }
        show.value = false;
        showPopover.value=false;
      })
      .catch(() => {
        // on cancel
        show.value = false;
        showPopover.value=false;
      });

}

/**
 * 跳转至更新队伍页
 * @param id
 */
const doAdminUser =  (id: number) => {
  Dialog.confirm({
    message:
        '请问你确认设置该用户为管理员吗？',
  })
      .then(async () => {

        const res = await myAxios.post('/user/update', {
          'id': id,
          "userRole": 1,
        });
        if (res.code === 0) {
          Toast.success('成功！' + (res.description ? `，${res.description}` : ''));
          show.value = false;
        }else {
          Toast.fail('失败！' + (res.description ? `，${res.description}` : ''));
        }
        show.value = false;
        showPopover.value=false;
      })
      .catch(() => {
        // on cancel
        show.value = false;
        showPopover.value=false;
      });
}
</script>

<style scoped>

</style>
