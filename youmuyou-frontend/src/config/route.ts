// 定义一些路由
import Index from "../pages/Index.vue";
import Team from "../pages/TeamPage.vue";
import UserPage from "../pages/UserPage.vue";
import UserUpdatePage from "../pages/UserUpdatePage.vue";
import UserTeamJoinPage from "../pages/UserTeamJoinPage.vue";
import UserTeamCreatePage from "../pages/UserTeamCreatePage.vue";
import SearchPage from "../pages/SearchPage.vue";
import SearchResultPage from "../pages/SearchResultPage.vue";
import UserEditPage from "../pages/UserEditPage.vue";
import UserLoginPage from "../pages/UserLoginPage.vue";
import TeamAddPage from "../pages/TeamAddPage.vue";
import TeamUpdatePage from "../pages/TeamUpdatePage.vue";
import UserRegeditPage from "../pages/UserRegeditPage.vue";
import TagsUpdatePage from "../pages/TagsUpdatePage.vue";
import UserPage1 from "../pages/UserPage.vue";
import TeamInfoPage from "../pages/TeamInfoPage.vue";
import UserTeamPrivatePage from "../pages/UserTeamPrivatePage.vue";


const routes = [
    { path: '/', component: Index },
    { path: '/index', component: Index },
    { path: '/team', title: '找队伍', component: Team },
    { path: '/team/add', title: '创建队伍', component: TeamAddPage },
    { path: '/team/info', title: '队伍详情', component: TeamInfoPage },
    { path: '/team/update', title: '更新队伍', component: TeamUpdatePage },
    { path: '/user', title: '个人信息', component: UserPage },
    { path: '/search', title: '找伙伴', component: SearchPage },
    { path: '/user/list', title: '用户列表', component: SearchResultPage },
    { path: '/user/edit', title: '编辑信息', component: UserEditPage },
    { path: '/user/login', title: '登录', component: UserLoginPage },
    { path: '/user/regedit', title: '注册', component: UserRegeditPage },
    { path: '/user/update', title: '更新信息', component: UserUpdatePage },
    { path: '/user/updateTags', title: '修改当前状态', component: TagsUpdatePage },
    { path: '/user/team/join', title: '我加入的队伍', component: UserTeamJoinPage },
    { path: '/user/team/private', title: '我私有的队伍', component: UserTeamPrivatePage },
    { path: '/user/team/create', title: '我创建的队伍', component: UserTeamCreatePage },
]

export default routes;
