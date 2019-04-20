import {
    requestGetList
} from './request'


export function getSchoolList(params) {
    return new Promise((resolve, reject) => {
        requestGetList('/users/api/school/', params).then(res => {
            resolve(res)
        }).catch(err => {
            reject(err)
        })
    })
}