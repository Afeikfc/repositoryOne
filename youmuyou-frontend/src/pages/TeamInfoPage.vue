<template>
  <template v-if="teamData">
    <van-cell-group inset>
      <van-cell>
        <van-card
            :desc="teamData.description"
            :thumb="teamData.avatarUrl===null || teamData.avatarUrl==='' ? teamImgs[Math.round(Math.random()*4)]:teamData.avatarUrl"
            :title="teamData?.name"
        >
          <template #tags>
            <van-tag plain style="margin-right: 8px; margin-top: 8px" type="danger">
              {{
                teamStatusEnum[teamData.status]
              }}
            </van-tag>
          </template>
        </van-card>
      </van-cell>
      <van-divider/>
      <van-cell :value="teamData.id" center title="队伍ID">
        <template #icon>
          <van-icon name="points" size="18"/>
        </template>
      </van-cell>
      <van-divider/>
      <van-cell :value="teamData.name" center title="队伍名">
        <template #icon>
          <van-icon name="award-o" size="18"/>
        </template>
      </van-cell>
      <van-divider/>
      <van-cell :value="teamData.createUser?.username" center title="队长">
        <template #icon>
          <van-icon name="http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202303092011964.png" size="18"/>
        </template>
      </van-cell>
      <van-divider/>
      <van-cell :value="teamData.description" center title="队伍描述">
        <template #icon>
          <van-icon name="http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202303092009329.png" size="18"/>
        </template>
      </van-cell>
      <van-divider/>
      <van-cell :value="teamData.hasJoinNum+' / '+teamData.maxNum" center title="队伍人数">
        <template #icon>
          <van-icon name="http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202303092007712.png" size="18"/>
        </template>
      </van-cell>
      <van-divider/>
      <van-cell v-if="teamData.expireTime" :value="moment(teamData.expireTime).format('lll')" center title="过期时间">
        <template #icon>
          <van-icon name="http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202303092008357.png" size="18"/>
        </template>
      </van-cell>
      <van-divider/>
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
          <van-cell center title="管理员操作">
            <template #icon>
              <van-icon name="info-o" size="18"/>
            </template>
          </van-cell>
        </template>
      </van-popover>
      <van-divider/>
      <van-cell center title="队伍成员">
        <template #icon>
          <van-icon name="http://zk45.oss-cn-shenzhen.aliyuncs.com/zk/202303092013234.png" size="18"/>
        </template>
      </van-cell>
        <user-card-list :loading="false" :userList="teamData.joinUserList"></user-card-list>
    </van-cell-group>
  </template>
</template>

<script lang="ts" setup>

// 获取之前的队伍信息
import {onMounted, ref} from "vue";
import {useRoute, useRouter} from "vue-router";
import {Toast} from "vant";
import myAxios from "../plugins/myAxios";
import {teamStatusEnum} from "../constants/team";
import {userRolesEnum} from "../constants/user";
import teamImgs from "../services/teamImg";
import moment from "moment";
import UserCardList from "../components/UserCardList.vue";
import {getCurrentUser} from "../services/user";

const route = useRoute();
const router = useRouter();
const teamData = ref();
const password = ref('');
const currentUser = ref();
const showPopover = ref(false);
const operations = ref([]);
const id = route.query.id;
onMounted(async () => {
    currentUser.value = getCurrentUser();
    //管理员更新或者删除队伍！
    if (userRolesEnum[currentUser.value.userRole]==="admin") {
        operations.value.push({text: '更新队伍', clickEvent: "updateTeam", icon: "add-o"},{text: '解散队伍', clickEvent: "deleteTeam", icon: "delete"});
    }
    if (userRolesEnum[currentUser.value.userRole]==="boss") {
        operations.value.push({text: '更新队伍', clickEvent: "updateTeam", icon: "add-o"},{text: '解散队伍', clickEvent: "deleteTeam", icon: "delete"});
    }
      if (id <= 0 && id != null) {
        Toast.fail('加载队伍失败');
        return;
      }
      const res = await myAxios.get("/team/get", {
        params: {
          id,
        }
      });
      if (res?.code === 0) {
        teamData.value = res.data;
        if (teamData.value.joinUserList) {
          teamData.value.joinUserList.forEach((user: { tags: string; }) => {
            if (user.tags) {
              user.tags = JSON.parse(user.tags);
            }
          })


        }
      } else {
        Toast.fail('加载队伍失败' + res.description);
        await router.push({
          path: '/team',
        })
      }
    })
const doClickEvent = (operationName: string) => {
  if (operationName === "updateTeam") {
    doUpdateTeam(teamData.value.id);
  }
  if (operationName === "deleteTeam") {
    doDeleteTeam(teamData.value.id);
  }
}

/**
 * 跳转至更新队伍页
 * @param id
 */
const doUpdateTeam = (id: number) => {
  router.push({
    path: '/team/update',
    query: {
      id,
    }
  })
}


/**
 * 解散队伍
 * @param id
 */
const doDeleteTeam = async (id: number) => {
  const res = await myAxios.post('/team/delete', {
    id,
  });
  if (res?.code === 0) {
    Toast.success('删除成功！');
    router.push({
      path: '/team',
      replace: true,
    });
  } else {
    Toast.fail('删除失败' + (res.description ? `，${res.description}` : ''));
  }
}

</script>

<style scoped>

</style>
