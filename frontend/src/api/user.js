import {
    requestGetList,
    requestPost,
}
from './request'


export function getUserList(params) {
    return new Promise((resolve, reject) => {
        requestGetList('/users/api/user/', params).then(res => {
            resolve(res)
        }).catch(err => {
            reject(err)
        })
    })
}

export function userDetail(id) {
    return new Promise((resolve, reject) => {
        requestGetList(`/users/api/user/${id}`).then(res => {
            resolve(res)
        }).catch(err => {
            reject(err)
        })
    })
}

export function userInfo(key) {
    return new Promise((resolve, reject) => {
        requestGetList('/users/api/user/get_user_info/', {
            key: key
        }).then(res => {
            resolve(res)
        }).catch(err => {
            reject(err)
        })
    })
}

export function userPost(data) {
    return new Promise((resolve, reject) => {
        requestPost('/users/api/user/', data).then(res => {
            resolve(res)
        }).catch(err => {
            reject(err)
        })
    })
}

export function userUploadIdCard(id, data) {
    return requestPost(`/users/api/user/${id}/upload_id_pic/`, data)
}