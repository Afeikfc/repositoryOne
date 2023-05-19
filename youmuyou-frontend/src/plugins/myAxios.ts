import axios, { AxiosInstance } from "axios";

const isDev = process.env.NODE_ENV === 'development';

const api = isDev
    ? ["http://localhost:8080/api", "http://localhost:8081/api"]
    : ["http://116.62.164.33:8080/api", "http://116.62.164.33:8081/api"];

const myAxios: AxiosInstance = axios.create({
    baseURL: api[Math.floor(Math.random() * api.length)],
});

myAxios.defaults.withCredentials = true; // 配置为true

// Add a request interceptor
myAxios.interceptors.request.use(
    function (config) {
        // Do something before request is sent
        return config;
    },
    function (error) {
        // Do something with request error
        return Promise.reject(error);
    }
);

// Add a response interceptor
myAxios.interceptors.response.use(
    function (response) {
        // 未登录则跳转到登录页
        if (response?.data?.code === 40100) {
            const redirectUrl = window.location.href;
            window.location.href = `/user/login?redirect=${redirectUrl}`;
        }
        // Do something with response data
        return response.data;
    },
    function (error) {
        // Do something with response error
        return Promise.reject(error);
    }
);

export default myAxios;
