import {
    requestGetList
} from './request'


export function getSubjectList(params) {
    return new Promise((resolve, reject) => {
        requestGetList('/users/api/subject/', params).then(res => {
            resolve(res)
        }).catch(err => {
            reject(err)
        })
    })
}