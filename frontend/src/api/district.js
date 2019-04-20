import {
    requestGetList
} from './request'


export function getDistrictList(params) {
    return new Promise((resolve, reject) => {
        requestGetList('/users/api/district/', params).then(res => {
            resolve(res)
        }).catch(err => {
            reject(err)
        })
    })
}